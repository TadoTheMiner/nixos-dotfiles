#!/bin/sh
perl -pe 's/\e([^\[\]]|\[.*?[a-zA-Z]|\].*?\a)//g' | hx
