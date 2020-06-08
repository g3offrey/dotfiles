#!/usr/bin/env zsh

function installDependencies() {
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions;
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting;

  echo "👌 dependencies installed";
}

function configureZsh() {
  cp ./.zshrc ~/.zshrc;

  source ~/.zshrc;

  echo "👌 zsh configured";
}

function configureGit() {
  cp ./.gitconfig ~/.gitconfig;
  cp ./.gitignore_global ~/.gitignore_global;

  echo "👌 git configured";
}

function configureVim() {
  cp ./.vimrc ~/.vimrc;

  echo "👌 vim configured";

}
function doIt() {
  if [ "$1" != "-u" ]; then
      installDependencies;
  fi
  
  configureZsh;
  configureGit;
  configureVim;
  echo "✅ Done";
}

set -e;
doIt $1;
unset installDependencies doIt configureZsh configureGit configureVim;