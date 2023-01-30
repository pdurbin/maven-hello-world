#!/bin/bash

VERSION=$(python3 bumpver.py)

docker build -t my-app:$VERSION --build-arg VERSION=$VERSION .
