#!/bin/bash
cp ./cpp.snip ~/.vim/bundle/neosnippet-snippets/neosnippets/cpp.snip 
cp ./.screenrc ~/.screenrc
cp ./.vimrc.local ~/.vimrc.local
cp ./.bashrc ~/.bashrc
cp ./git-completion.bash ~/git-completion.bash


# setup git color (http://stackoverflow.com/questions/1156069/how-to-configure-mac-os-x-term-so-that-git-has-color)
git config --global color.ui true

# setup git user 
git config --global user.name  "qqibrow"
git config --global user.email  "qqibrow@gmail.com"
