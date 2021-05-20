#!/bin/zsh
docker_c0() { docker run --rm --user=$(id -u):$(id -g) -v "$(pwd)":/code -w /code -it dbatunituebingen/c0:latest $@; }
execc0() { docker_c0 ./$@; }
cc0() { docker_c0 cc0 $@; }
rm -rf ./build/*
mkdir build
cp -r ./src/* ./build/
cd build
cc0 -d -x -o main main.c0
cd ..
cp build/out.png out/render_$(date +"%F").$(date +"%H-%M-%S").png
rm -r build