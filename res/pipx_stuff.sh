#!/usr/bin/env bash

pipx install argcomplete
echo 'eval "$(register-python-argcomplete pipx)"' >> $HOME/.bashrc

pipx install doit
echo '# doit tab completion' >> $HOME/.bashrc
echo 'eval "$(doit tabcompletion)"' >> $HOME/.bashrc

pipx install virtualenv
pipx install ipython
pipx install bump2version
pipx install cookiecutter
pipx install black
