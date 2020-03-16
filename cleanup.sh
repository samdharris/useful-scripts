#!/usr/bin/bash

git remote -v 2>/dev/null
resp=$?
if [[ $resp -ne 0 ]]
then
	echo "$(pwd) is not a git repository! exiting..."
	exit 1
fi

branches="$(git branch --merged)"
for b in $branches
do
    if [$b = 'master']
    then
        continue
    fi

    if [$b = 'dev']
    then
        continue
    fi

    echo "deleting branch $b"
    git branch -d -r $b

done
git fetch --prune
