#!/bin/bash
trap "exit" SIGINT SIGKILL
set -e
for _dir in *; do
    if [ -d "$_dir" ]; then
        echo "building $_dir"
        cd $_dir
        haxelib run flow run || break;
        cd ../
    fi
done