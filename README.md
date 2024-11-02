# StreamKiste-Downloader

Just a Shell script to download movies from StreamKiste.

Make sure you don't run into the DNS block by using 9.9.9.9 or *DNS Over HTTPS*.

The logic is only layed out to use URLs from the **VOE** mirror!
When using the Mirror **Streamtape** you can just watch the Network tab of the browser and download that one file via e.g. **wget**.

# StramingKiste/VOD

```sh
for segment in $(seq 1 944); do
	url="https://delivery-node-3ps6hllpqglekwne.voe-network.net/engine/hls2/01/08909/y1lbr5lqvp6w_,n,.urlset/seg-${segment}-v1-a1.ts?t=62lzT2xxa9VWTM1ATbngjoY4T7HVvXtfpzS_GKO37Vs&s=1730571076&e=14400&f=44549939&node=delivery-node-3ps6hllpqglekwne.voe-network.net&i=78.54&sp=2500&asn=6805"
	if ! [ -f $(printf '%04d' $segment).mp4 ]; then
		wget -q "${url}" -O- > $(printf '%04d' ${segment}).mp4
	fi
done
find . -size -1k
find . -size -1k -delete
cat * > ../${PWD##*/}.mp4
```

# ZDF

```sh
find . -size -1k -delete

for segment in $(seq 0 1082); do
	url="https://zdfvod-pckgr.akamaized.net/i/,/mp4/de/zdf/24/08/240806_1950_2599_tischtennis_vf_team_ger_swe_m_l2f_spo/1/240806_1950_2599_tischtennis_vf_team_ger_swe_m_l2f_spo,_776k_p11,_1496k_p13,_2296k_p14,_3296k_p15,v13.mp4.csmil/segment-${segment}-f4-v1-a1.ts"
	if ! [ -f $(printf '%04d' ${segment}).mp4 ]; then
		wget "${url}" -O- > $(printf '%04d' ${segment}).mp4
	fi
done
cat * > ../combined.mp4
```

# [Tinyzone](https://ww3.tinyzone.org/)

At first open a stream and watch the network traffic in your browser. Try to find a pattern in the content that is getting downloaded and make sure to watch all file types.

For some movies you need to give a certain file ending

```sh
for segment in $(seq 281 9999); do curl "https://nboe.mv39844ac.site/_v2/12a3c523fe105800ed8c394685aeeb0b932eae5c1cbdf6b6114d7baea93ece832257df1a4b6125fcfa38c35da05dee86aad28d46d73fc4e9d4e5a67f0720afd134c614e3091fb40f12c6f1ab6b462219626fd23c4c47319ec79fb95c99be69c13c44/h/f3/efbc$(printf '%04d' ${segment}).gif" -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:125.0) Gecko/20100101 Firefox/125.0' -H 'Accept: */*' -H 'Accept-Language: en,de;q=0.5' -H 'Accept-Encoding: gzip, deflate, br' -H 'Origin: https://vvid30c.site' -H 'DNT: 1' -H 'Sec-GPC: 1' -H 'Connection: keep-alive' -H 'Sec-Fetch-Dest: empty' -H 'Sec-Fetch-Mode: cors' -H 'Sec-Fetch-Site: cross-site' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' -H 'TE: trailers' > $(printf '%04d' ${segment}).mp4 ; done

find /mnt/c/Users/rho/Desktop/oppenheimer -size -2k -delete; cat * > ../movie.mp4
```

Others switch file endings

```sh
for segment in $(seq 0 9999); do
  for format in html js css txt vtt srt woff jpg gif png; do
    curl "https://nboe.mv39844ac.site/_v2/12a3c523fe105800ed8c394685aeeb0b932eae5c1cbdf6b6114d7baea93ece832257df1a4b6125fcfa38c35da05dee86aad28d46d73fc4e9d4e5a67f0720afd134c614e3091fb40f12c6f1ab6b462219626fd23c4c47319ec79fb95c99be69c13c44/h/f3/efbc$(printf '%04d' ${segment})."${format} -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:125.0) Gecko/20100101 Firefox/125.0' -H 'Accept: */*' -H 'Accept-Language: en,de;q=0.5' -H 'Accept-Encoding: gzip, deflate, br' -H 'Origin: https://vvid30c.site' -H 'DNT: 1' -H 'Sec-GPC: 1' -H 'Connection: keep-alive' -H 'Sec-Fetch-Dest: empty' -H 'Sec-Fetch-Mode: cors' -H 'Sec-Fetch-Site: cross-site' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' -H 'TE: trailers' > $(printf '%04d' ${segment}).${format}
  done
done

find /mnt/c/Users/rho/Desktop/oppenheimer -size -2k -delete; cat * > ../movie.mp4
```

# URLs

- [Tinyzone](https://ww3.tinyzone.org/)
- [StreamKiste](https://streamkiste.tv/)
