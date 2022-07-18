#!/bin/bash

cd $(dirname $0)

SOURCE=$(jq -r '.reference.P854 // .reference.P854' meta.json)

if [[ $SOURCE == http* ]]
then
  CURLOPTS='--compressed -L -c /tmp/cookies -A eps/1.2'
  curl $CURLOPTS -o official.html $SOURCE
fi

cd ~-
