#!/bin/bash

problems=(
#p01
#p02
#p03
#p04
#p05
#p06
#p07
#p08
#p09
#p10
)

for i in ${problems[@]};
do
  cd $i
  cp task4.props task5.props
  cp task5.props task6.props
  cp task3.props task4.props
  vim -p task3.props task4.props task5.props task6.props
  cd ..
done

coalitions=(
c01
c02
c03
c04
c05
c06
c07
c08
c09
c10
)

for i in ${coalitions[@]};
do
  cd $i/2S
  cp task4.agents task5.agents
  cp task5.agents task6.agents
  cp task3.agents task4.agents
  vim -p task3.agents task4.agents task5.agents task6.agents
  cd ../..
done
