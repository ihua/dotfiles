#!/bin/sh

if [ ! -d $HOME/.vim/bundle ]; then
    mkdir -p $HOME/.vim/bundle
fi

curdir=`pwd`
cd $HOME/.vim/bundle
if [ ! -d $HOME/.vim/bundle/vundle ]; then
    git clone https://github.com/gmarik/vundle.git
fi

cd $curdir
ln -s $curdir/vimrc $HOME/.vimrc
