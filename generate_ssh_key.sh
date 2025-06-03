#!/usr/bin/env bash

if [[ ! $GH_EMAIL ]]; then
    echo "You need to set a value for GH_EMAIL"
    echo "Ex:"
    echo "GH_EMAIL=name@mail.com $BASH_SOURCE"
    return &>/dev/null || exit
fi

dashes() {
    echo "------------------------------------------------------------------------"
}

dashes

# install openssh-client
if ! hash ssh-keygen &> /dev/null ; then
    sudo apt install -y openssh-client || sudo dnf install -y openssh
fi

# install git
if ! hash git &> /dev/null; then
    sudo apt install -y git || sudo dnf install -y git
fi

dashes

ssh-keygen -t ed25519 -C "$GH_EMAIL" -f ~/.ssh/id_ed25519 -N ''
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

dashes

if [[ ! -f ~/.ssh/id_ed25519 ]]; then
    echo "Failed to generate SSH key"
    return &>/dev/null || exit
fi

echo
echo "All good, you can now copy the contents of"
echo "~/.ssh.id_ed25519.pub"
dashes
cat ~/.ssh/id_ed25519.pub
dashes
echo 
echo "and add your ssh key at:"
echo
echo "https://github.com/settings/keys"
echo
