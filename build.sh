#!/bin/bash

set -o errexit -o nounset
TRAVIS_BRANCH=master
if [ "$TRAVIS_BRANCH" != "master" ]
then 
	    echo "This commit was made against the $TRAVIS_BRANCH and not the master! No deploy!" 
		    exit 0
		fi
		rev=$(git rev-parse --short HEAD)
		cd public
		git init
		git config user.name "Travis"
		git config user.email "evey_wong@163.com"
		git remote add upstream https://evey-huang:$TOKEN@github.com/Evey-huang/Evey-huang.github.io
		git fetch upstream
		git reset upstream/master
		#echo "custom domain" > CNAME
		git add -A
		git commit -m "rebuild pages at ${rev}"
		git push -q upstream HEAD:master

