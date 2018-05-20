#!/bin/sh

set -ex
mkdir -p dist

if [ $(uname) = "Darwin" ] ; then
    TRAVIS_OS_NAME="osx"
else
    TRAVIS_OS_NAME="linux"
fi

for p in "2.7" "3.4" "3.5" "3.6" ; do
    export MB_PYTHON_VERSION="${p}"
	source multibuild/common_utils.sh
	source multibuild/travis_steps.sh
	before_install
	build_wheel pyosmium x86_64
	deactivate
	cp wheelhouse/* dist/
done