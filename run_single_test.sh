#!/bin/bash
source ./tests/executerobot.sh

if [[ $1 == ./* ]];
then
  runByFile $1 $2;
else
  runByTestName "$1" $2;
fi
