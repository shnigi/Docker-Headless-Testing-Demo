#!/bin/sh
# executerobot.sh: a  shell script to run robot tests. These commands can be used directly as well.

function runByTestName() {
  if [[ $2 == "HeadlessChrome" ]]; then
     robot --test "$1" -v BROWSER:HeadlessChrome -d results .
  elif [[ $1 == "HeadlessFirefox" ]]; then
    robot --test "$1" -v BROWSER:HeadlessFirefox -d results .
  elif [[ $1 == "Firefox" ]]; then
    robot --test "$1" -v BROWSER:Firefox -d results .
  else
     robot --test "$1" -d results .
  fi
}

function runByFile() {
  if [[ $2 == "HeadlessChrome" ]]; then
     robot -v BROWSER:HeadlessChrome -d results $1
  elif [[ $1 == "HeadlessFirefox" ]]; then
    robot -v BROWSER:HeadlessFirefox -d results $1
  elif [[ $1 == "Firefox" ]]; then
    robot -v BROWSER:Firefox -d results $1
  else
     robot -d results $1
  fi
}

function runAllTests() {
  if [[ $1 == "HeadlessChrome" ]]; then
     robot -v BROWSER:HeadlessChrome -d results .
  elif [[ $1 == "HeadlessFirefox" ]]; then
    robot -v BROWSER:HeadlessFirefox -d results .
  elif [[ $1 == "Firefox" ]]; then
    robot -v BROWSER:Firefox -d results .
  else
     robot -d results .
  fi
}
