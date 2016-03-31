#!/bin/bash

problem=$1
coalition=$2
services=$3
output=$4

rm -rf $output
mkdir -p $output

cp $problem/objects.pddl $output/problem.pddl
cat $coalition/objects.pddl >> $output/problem.pddl
echo ")" >> $output/problem.pddl
cat $problem/init.pddl >> $output/problem.pddl
cat $coalition/init.pddl >> $output/problem.pddl
echo ")" >> $output/problem.pddl
cat $problem/goal_metric.pddl >> $output/problem.pddl

cp $problem/objects.pddl $output/problem_empty.pddl
cat $coalition/objects.pddl >> $output/problem_empty.pddl
echo ")" >> $output/problem_empty.pddl
cat $problem/init.pddl >> $output/problem_empty.pddl
cat $coalition/init.pddl >> $output/problem_empty.pddl
echo ")" >> $output/problem_empty.pddl
echo "(:goal (and))" >> $output/problem_empty.pddl
echo "(:metric minimize (total-time))" >> $output/problem_empty.pddl
echo ")" >> $output/problem_empty.pddl

cp $problem/task*p* $output
cp $coalition/$services/task*a* $output
