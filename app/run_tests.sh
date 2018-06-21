#!/bin/bash

FILES=$(find $PWD/tests/Feature -name "*.php")
while IFS= read -r line
do
  echo "test to run:  $line"
  vendor/bin/phpunit $line
done <<< "$FILES"


FILES=$(find $PWD/tests/Unit -name "*.php")
while IFS= read -r line
do
  echo "test to run:  $line"
  vendor/bin/phpunit $line
done <<< "$FILES"
