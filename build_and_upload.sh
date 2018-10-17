#!/bin/bash

cd ./helm/src
./build_private.sh
cd ..
cd ..
git add .
git commit -m "INITIAL"
git push
