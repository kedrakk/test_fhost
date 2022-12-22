#!/bin/bash
[[ -d public ]] && rm -r public
mkdir public
cp -R build/web public
