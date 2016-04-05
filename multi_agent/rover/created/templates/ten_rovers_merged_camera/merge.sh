#!/bin/bash

coalitions=(c01 c02 c03 c04 c05 c06 c07 c08 c09 c10)
services=(1S 2S)
problems=(p01 p02 p03 p04 p05 p06 p07 p08 p09 p10)

for d in ${problems[@]};
do
  cd $d
  cat task1.props >> task0.props
  cat task2.props >> task0.props
  git rm task1.props
  git rm task2.props
  git mv task3.props task1.props
  git mv task4.props task2.props
  cd ..
done

for d in ${coalitions[@]};
do
  cd $d
  for s in ${services[@]};
  do
    cd $s
    vim -p task0.agents task1.agents task2.agents
    git rm task1.agents
    git rm task2.agents
    git mv task3.agents task1.agents
    git mv task4.agents task2.agents
    cd ..
  done
  cd ..
done
