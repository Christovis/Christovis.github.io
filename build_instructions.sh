#!/bin/bash

# from my server space chrbecker.net on greenhost.nl server type into shell:
wget -r -p -U Mozilla --wait=1 --limit-rate=35K https://christovis.github.io//

# replace all references to github page with link to my website
sed "s/christovis.github.io/chrbecker.net/g" ./talks/* -i
sed "s/christovis.github.io/chrbecker.net/g" ./research/* -i
sed "s/christovis.github.io/chrbecker.net/g" ./blog/* -i
sed "s/christovis.github.io/chrbecker.net/g" ./software -i
sed "s/christovis.github.io/chrbecker.net/g" ./contact -i
sed "s/christovis.github.io/chrbecker.net/g" ./about -i
sed "s/christovis.github.io/chrbecker.net/g" ./index.html -i
sed "s/christovis.github.io/chrbecker.net/g" ./feed.xml -i
sed "s/christovis.github.io/chrbecker.net/g" ./robots.txt -i
