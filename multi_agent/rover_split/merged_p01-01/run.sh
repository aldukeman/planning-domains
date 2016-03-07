#!/bin/bash

script_name=`realpath $0`
dir=`dirname $script_name`
root=$dir/..
planner_dir=$HOME/dev/planners/popf2

domain=$dir/domain.pddl
problem=$dir/pfile01-001.pddl
empty_problem=$dir/pfile01-001-empty.pddl

compress()
{
  echo "$planner_dir/compress $1 $2 $3"
  $planner_dir/compress $1 $2 $3
}

plan()
{
  $planner_dir/plan $1 $2 $3
}

merge()
{
  $root/bin/append $1 $2 $3
}

iterate()
{
  local old_master_plan=$1
  local old_iterative_plan=$2
  local new_master_plan=$3
  local domain=$4
  local complete_problem=$5
  local old_iterative_problem=$6
  local new_iterative_tasks=$7
  local new_iterative_problem=$8
  local new_cumulative_problem=$9
  local new_iterative_agent_file=${10}
  local new_filtered_problem=${11}
  local new_iterative_plan=${12}

  echo "$root/bin/problemmerge -d $domain -P $complete_problem $old_iterative_problem $new_iterative_problem -p $old_iterative_plan -g $new_iterative_tasks"
  #read -p ""
  $root/bin/problemmerge -d $domain -P $complete_problem $old_iterative_problem $new_iterative_problem -p $old_iterative_plan -g $new_iterative_tasks
  echo "$root/bin/problemsplit --agent-file $new_iterative_agent_file -p $new_iterative_problem $new_filtered_problem"
  #read -p ""
  $root/bin/problemsplit --agent-file $new_iterative_agent_file -p $new_iterative_problem $new_filtered_problem
  echo "plan $domain $new_filtered_problem $new_iterative_plan"
  #read -p ""
  plan $domain $new_filtered_problem $new_iterative_plan
  echo "$root/bin/append $old_master_plan $new_iterative_plan $new_master_plan"
  #read -p ""
  $root/bin/append $old_master_plan $new_iterative_plan $new_master_plan
}

#        old_master_plan old_iterative_plan  new_master_plan    domain         complete_problem       old_iterative_problem   new_iterative_tasks new_iterative_problem new_iterative_agent_file  new_filtered_problem  new_iterative_plan
iterate $dir/empty_plan $dir/empty_plan $dir/solution.master $domain $problem $empty_problem $dir/task0.props $dir/iter_problem.pddl $dir/cumulative_problem.pddl $dir/task0.agents $dir/iter_problem_filtered.pddl $dir/solution.iter
cp $dir/solution.master $dir/solution.master.old
#compress $dir/domain.pddl $dir/cumulative_problem.pddl $dir/solution.master > $dir/solution.master.compressed1

iterate $dir/solution.master.old $dir/solution.iter $dir/solution.master $domain $problem $dir/iter_problem.pddl $dir/task1.props $dir/iter_problem.pddl $dir/cumulative_problem.pddl $dir/task1.agents $dir/iter_problem_filtered.pddl $dir/solution.iter
cp $dir/solution.master $dir/solution.master.old
#compress $dir/domain.pddl $dir/cumulative_problem.pddl $dir/solution.master > $dir/solution.master.compressed2

iterate $dir/solution.master.old $dir/solution.iter $dir/solution.master $domain $problem $dir/iter_problem.pddl $dir/task2.props $dir/iter_problem.pddl $dir/cumulative_problem.pddl $dir/task2.agents $dir/iter_problem_filtered.pddl $dir/solution.iter
cp $dir/solution.master $dir/solution.master.old
#compress $dir/domain.pddl $dir/cumulative_problem.pddl $dir/solution.master > $dir/solution.master.compressed3

iterate $dir/solution.master.old $dir/solution.iter $dir/solution.master $domain $problem $dir/iter_problem.pddl $dir/task3.props $dir/iter_problem.pddl $dir/cumulative_problem.pddl $dir/task3.agents $dir/iter_problem_filtered.pddl $dir/solution.iter
cp $dir/solution.master $dir/solution.master.old
#compress $dir/domain.pddl $dir/cumulative_problem.pddl $dir/solution.master > $dir/solution.master.compressed4

iterate $dir/solution.master.old $dir/solution.iter $dir/solution.master $domain $problem $dir/iter_problem.pddl $dir/task4.props $dir/iter_problem.pddl $dir/cumulative_problem.pddl $dir/task4.agents $dir/iter_problem_filtered.pddl $dir/solution.iter

compress $domain $problem $dir/solution.master > $dir/solution.master.compressed5

#Usage: ./bin/problemmerge [options]
#
#Options:
#   -p <iterative_plan>
#   --plans <iterative_plan>
#       Iterative plan for constructing achieved goal state
#
#   -d <domain_file>
#   --domain <domain_file>
#       Use domain file to confirm plan
#
#   -P <complete_problem> <iterative_problem>
#   --problems <complete_problem> <iterative_problem> <new_problem_file>
#       Complete problem to get objects from and iterative problem to get goal state from 
#       written to new_problem_file
#
#   -g <goals_file>
#   --goals-file <goals_file>
#     File with new goals to accomplish for next iteration
#
#   -h
#   --help
#       Show this output

#Usage: ./bin/plansplit
#   -a <agent_1> ... <agent_n>
#   --agent <agent_1> ... <agent_n>
#       Add agents to be ignored
#
#   --agent-file <file>
#       File with list of line delimited agents
#
#   -p <problem_file>
#   --problem <problem_file>
#       PDDL problem to filter
#
#   -t <task_1> ... <task_n>
#   --task <task_1> ... <task_n>
#       Add tasks to be accomplished
#
#   --task-file <file>
#       File with list of line delimited tasks in the form of propositions
