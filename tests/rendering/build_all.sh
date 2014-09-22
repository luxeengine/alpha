for _dir in *; do
    if [ -d "$_dir" ]; then
        echo "building $_dir"
        cd $_dir
        haxelib run flow run
        cd ../
    fi
done