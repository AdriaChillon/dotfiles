#!/bin/sh
set -e

cd ~/.ciber_dotfiles/vim_runtime

echo '" DO NOT EDIT THIS FILE
" Add your own customizations in ~/.ciber_dotfiles/vim_runtime/my_configs.vim

set runtimepath+=~/.ciber_dotfiles/vim_runtime

source ~/.ciber_dotfiles/vim_runtime/vimrcs/basic.vim
source ~/.ciber_dotfiles/vim_runtime/vimrcs/filetypes.vim
source ~/.ciber_dotfiles/vim_runtime/vimrcs/plugins_config.vim
source ~/.ciber_dotfiles/vim_runtime/vimrcs/extended.vim
try
  source ~/.ciber_dotfiles/vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"