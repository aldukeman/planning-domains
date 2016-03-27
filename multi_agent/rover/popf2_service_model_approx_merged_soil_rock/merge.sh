#!/bin/bash

pause()
{
  read -p "press enter to continue..."
}

for D in `find * -type d`
do
  echo $D
  pause

  vim -p $D/task1.agents $D/task2.agents

  echo "" >> $D/task1.props
  cat $D/task2.props >> $D/task1.props

  git rm $D/task2.props
  git mv $D/task3.props $D/task2.props
  git mv $D/task4.props $D/task3.props

  git rm $D/task2.agents
  git mv $D/task3.agents $D/task2.agents
  git mv $D/task4.agents $D/task3.agents
done
