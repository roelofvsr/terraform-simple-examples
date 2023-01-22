#!/bin/bash
# This script loops over all directories in the test folder and executes a 'go test'
# Important is that this script is executed inside the "/test" folder of the repo, otherwise it will fail

# make a list of all directories in the test folder
dir_list=`ls | grep test_module`

# check if go.mod  and go.sum exist:
for dir in $dir_list
do
    len=`ls "$dir" | grep go.`
    if [ ${#len} -gt 0 ]
    then
      echo 'go.mod or go.sum already exists, remove from repo and run test again'
      exit 1
    fi 
done

# for each directory in the list, execute a go test
for dir in $dir_list
do
    ( cd "$dir" && 
    go mod init terra_config &&
	go mod tidy &&
	go test -v -timeout 30m )
done
