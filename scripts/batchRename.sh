#!/bin/bash

for file in *.jpg
do
  mv "$file" "${file/toBeReplaced/replaceWith}"
done
