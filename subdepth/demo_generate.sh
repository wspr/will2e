#!/usr/bin/env bash

pdflatex --jobname subdepth-demo-0 '\def\CASE{0}\input{subdepth-demo.ltx}'
pdflatex --jobname subdepth-demo-1 '\def\CASE{1}\input{subdepth-demo.ltx}'
pdflatex --jobname subdepth-demo-2 '\def\CASE{2}\input{subdepth-demo.ltx}'
pdflatex --jobname subdepth-demo-3 '\def\CASE{3}\input{subdepth-demo.ltx}'
