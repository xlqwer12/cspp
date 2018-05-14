#!/bin/bash

# cd $root_path_to_project
./cpplint.py --root=src --linelength=120 $( find src -name \*.h -or -name \*.cc | grep -vE "^\.\/build\/" | grep -vE "^\.\/third_party\/" | grep -vE "^\.\/tests\/" )
# ./cpplint.py --root=src --linelength=120 $( find src -not -path "src/scb/proto/*" -name \*.h -or -name \*.cc | grep -vE "^\.\/build\/" | grep -vE "^\.\/third_party\/" | grep -vE "^\.\/tests\/" )
