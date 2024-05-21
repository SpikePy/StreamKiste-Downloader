# StreamKiste-Downloader

Just a Shell script to download movies from StreamKiste.

Make sure you don't run into the DNS block by using 9.9.9.9 or *DNS Over HTTPS*.

The logic is only layed out to use URLs from the **VOE** mirror!
When using the Mirror **Streamtape** you can just watch the Network tab of the browser and download that one file via e.g. **wget**.


# [Tinyzone](https://ww3.tinyzone.org/)

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
