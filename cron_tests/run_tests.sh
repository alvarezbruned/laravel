#!/bin/bash
while :;
  do
    FILES=$(find /var/www/tests/Feature -name "*.php")
    while IFS= read -r line
    do
      echo "test to run:  $line"
      /var/www/vendor/bin/phpunit $line
    ## |& tee /var/log/cron.log
    done <<< "$FILES"
    
    
    FILES=$(find /var/www/tests/Unit -name "*.php")
    while IFS= read -r line
    do
      echo "test to run:  $line"
    ## |& tee /var/log/cron.log
      /var/www/vendor/bin/phpunit $line
    done <<< "$FILES"
    sleep 60
done
