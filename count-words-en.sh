#!/bin/bash
#detexed=$(detex /home/yky/latex/paranoia/paranoia.tex)
pdftotext /home/yky/latex/paranoia/paranoia-en.pdf
# ^^^^ this may generate an error but it seems harmless
detexed=$(<paranoia-en.txt)

# Remove all that is not English alphabet;  result = all English words
ewords=$(perl -CIOED -p -e 's/[^a-zA-Z0-9\s]/ /g' <<< $detexed)
# echo $ewords
ecount=$(bc <<< "$(wc -w <<< $ewords) - 30")
echo $ecount

# Remove all non-Chinese chars; result = all Chinese chars
# cwords=$(perl -CIOED -p -e 's/[^\p{Block=CJK_Unified_Ideographs}]//g' <<< $detexed)
# Count all Chinese chars,  Count all English words
# ccount=$(wc -m <<< $cwords)

echo $ecount > word-count-en.txt

# Round off to nearest 100
# python -c "print int(round(${words}/100.0)*100)" > word-count.txt
