#!/bin/sh

#
# ENV VAR to setup in CI : FURY_TOKEN

for file in `ls *gemspec`; do
    gem build $file
done
for file in `ls *gem`; do
    curl -s -o /dev/null -w "%{http_code}" -F package=@$file "https://${FURY_TOKEN}@push.fury.io/finalcad/" | grep "200"
    if [ $? -ne 0 ]; then
        echo "Could not upload package"
        exit 1
    fi
done
