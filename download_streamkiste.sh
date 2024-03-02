#!/bin/sh
set -eu
cd ~
clear

printf 'StreamKiste Downloader\n'
printf '======================\n\n'

printf 'Movie Name: '
read name

name_slug=$(echo "${name}" | tr -c '[:alnum:]' '_')
path_full_movie=~/"${name_slug}".ts

mkdir -p "${name_slug}_segments"
cd "${name_slug}_segments"

printf "Media-URL (Paste one of the URLs you see in the browsers network tab under Media): "
read media_url

printf '\n'
segment=1
while wget -q "$(echo "${media_url}" | sed "s/seg-[0-9]*/seg-${segment}/")" -O "$(printf '%04d.ts' ${segment})"; do
  printf 'Download Segment: %04d\n' ${segment}
  segment=$((segment+1))
done
printf '\n'

printf "\nCombine Segments to single Movie and save it to '${path_full_movie}'\n"
cat * > "${path_full_movie}"