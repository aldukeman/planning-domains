#!/bin/bash

cd $1
mv task0.props high_res.props
mv task1.props soil.props
mv task2.props rock.props
mv task3.props low_res.props
mv task4.props color.props 

mv high_res.props task0.props
mv low_res.props task1.props
mv color.props task2.props
mv soil.props task3.props
mv rock.props task4.props
