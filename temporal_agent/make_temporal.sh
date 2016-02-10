#!/bin/bash

root=$(dirname $(readlink -f $0))

for dom in $root/base/*
do
  dom=$(basename $dom)
  rm -rf "$root/converted/$dom"
  mkdir -p "$root/converted/$dom"
  for f in $root/base/$dom/*.pddl
  do
    domain_file="$root/base/$dom/domain.pddl"
    if [ $f != $domain_file ]
    then
      $root/ppp.py "$domain_file" "$f" "$root/converted/$dom/domain.pddl" "$root/converted/$dom/$(basename $f)" > /dev/null
    fi
  done
done
