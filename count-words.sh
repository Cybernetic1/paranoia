#!/bin/bash
words=$(detex /home/yky/latex/paranoia/paranoia.tex | wc -m)
python -c "print int(round(${words}/100.0)*100)" > word-count.txt
