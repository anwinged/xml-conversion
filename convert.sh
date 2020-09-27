#!/usr/bin/env bash

set -eux -o pipefail

converters=( Unordered Parker BadgerFish Abdera JsonML Columnar )

for i in "${converters[@]}"
do
  echo "$i"

  mkdir -p "converted/$i"

  docker run -it \
    -v "$PWD:/data" \
    -u "$(id -u):$(id -g)" \
    xmlschema-python \
    xmlschema-xml2json \
    config.xml --converter "$i" --output "converted/$i" --force

    jq -r . "converted/$i/config.json" > "converted/$i/pretty.json"
done

