#!/bin/bash
# Note: pushd/popd only work in bash

sudo apt-get update

sudo apt-get install -y \
    curl emacs unzip python-dev python-setuptools build-essential erlang-nox erlang-dev \
    libevent-dev git golang mercurial openjdk-7-jdk ruby rubygems haskell-platform

sudo easy_install pip ws4py gevent gevent-websocket tornado twisted txws supervisor

# Clone master
git clone git://github.com/ericmoritz/wsdemo.git wsdemo

# Update sysctl
sudo cp wsdemo/etc/sysctl.conf /etc/
sudo sysctl -p

# install the wsdemo_monitor package
sudo easy_install wsdemo/priv/wsdemo_monitor

# install pypy
pushd wsdemo/competition
    if [ ! -d ./pypy-2.0.2 ]; then
       # TODO make this platform independant
       curl http://cdn.bitbucket.org/pypy/pypy/downloads/pypy-2.0.2-linux64.tar.bz2 | tar xj
    fi
    curl http://python-distribute.org/distribute_setup.py | ./pypy-2.0.2/bin/pypy
    ./pypy-2.0.2/bin/easy_install pip
    ./pypy-2.0.2/bin/pip install tornado ws4py twisted txws
popd

# install Node
sudo apt-get install python-software-properties python g++ make
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs

# install Play
pushd wsdemo/competition
   if [ ! -d ./play-2.0.1 ]; then
       curl -O http://download.playframework.org/releases/play-2.0.1.zip
       unzip play-2.0.1.zip
   fi
popd

npm install websocket ws
sudo go get code.google.com/p/go.net/websocket
sudo gem install em-websocket

sudo cabal update
sudo cabal install snap-server snap-core websockets websockets-snap
