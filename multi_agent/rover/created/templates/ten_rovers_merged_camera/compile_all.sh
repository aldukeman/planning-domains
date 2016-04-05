#!/bin/bash


#./compile.sh p01 c01 1S ../../../domain.pddl ../../ten_rovers/p01_c01_1S

compile()
{
  ./compile.sh $1 $2 $3 ../../../domain.pddl ../../ten_rovers_merged_camera/${1}_${2}_${3}
}

PROBLEMS=(p01 p02 p03 p04 p05 p06 p07 p08 p09 p10)
COALITIONS=(c01 c02 c03 c04 c05 c06 c07 c08 c09 c10)
SERVICES=(1S 2S)

for i in ${PROBLEMS[@]};
do
  for j in ${COALITIONS[@]};
  do
    for k in ${SERVICES[@]};
    do
      compile $i $j $k
    done
  done
done
