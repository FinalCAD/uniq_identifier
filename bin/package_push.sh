#!/bin/sh

#
# ENV VAR to setup in CI : FURY_TOKEN

for file in `ls *gemspec`; do
    gem build $file
done
for file in `ls *gem`; do
    curl -F package=@$file "https://${FURY_TOKEN}@push.fury.io/finalcad/"
done
