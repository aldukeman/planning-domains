#!/bin/bash

coalitions=(c01 c02 c03 c04 c05 c06 c07 c08 c09 c10)
services=(1S 2S)
problems=(p01 p02 p03 p04 p05 p06 p07 p08 p09 p10)

for d in ${problems[@]};
do
  cd $d
  cat task4.props >> task3.props
  git rm task4.props
  cd ..
done

for d in ${coalitions[@]};
do
  cd $d
  for s in ${services[@]};
  do
    cd $s
    echo ${d}_${s}
    vim -p task3.agents task4.agents
    git rm task4.agents
    cd ..
  done
  cd ..
done
