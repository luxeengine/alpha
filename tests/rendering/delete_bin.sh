for _dir in *; do
    if [ -d "$_dir" ]; then
        echo "cleaning $_dir"
        cd $_dir
        rm -rf ./bin
        cd ../
    fi
done