#!/bin/sh

dotfiles_dir=$PWD

# Check arguments
for arg in "$@"
do
    case $arg in
        -h | --help )       echo "A simple script to automate setting up debian/ubuntu environment"
                            echo "VALID ARGUMENTS:"
                            echo "-d, --desktop:    Install desktop only packages"
                            echo "-h, --help:       show this info"
                            exit 0
                            ;;
        -d | --desktop )    for line in $(cat desktop-packages.txt)
                            do
                                sudo apt install $line -y
                            done
                            ;;
    esac
done

for line in $(cat packages.txt)
do
    sudo apt install $line -y
done

rm -rf ~/.zshrc
cp $dotfiles_dir/.nanorc ~

while true; do
    read -p "Install python? [y/n]: " yn
    case $yn in
        [Yy]* ) sudo apt install python3 python3-pip
                pip3 install -r pip-packages.txt
                break;;
        [Nn]* ) break;;
        * )     echo "Please answer [y]es or [n]o.";;
    esac
done

while true; do
    read -p "Install oh-my-zsh? [y/n]: " yn
    case $yn in
        [Yy]* ) rm -rf ~/.oh-my-zsh
                sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
                git clone "https://github.com/zsh-users/zsh-autosuggestions" ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
                break;;
        [Nn]* ) break;;
        * )     echo "Please answer [y]es or [n]o.";;
    esac
done

cp $dotfiles_dir/.zshrc ~

while true; do
    read -p "Install anaconda? [y/n]: " yn
    case $yn in
        [Yy]* ) wget "https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh"
                chmod +x Anaconda3-2021.05-Linux-x86_64.sh
                ./Anaconda3-2021.05-Linux-x86_64.sh
                cat $dotfiles_dir/anaconda.txt >> ~/.zshrc
                break;;
        [Nn]* ) break;;
        * )     echo "Please answer [y]es or [n]o.";;
    esac
done

# Set home directory in .zshrc
sed -i "s#HOME_DIR#$HOME#" ~/.zshrc

# Set git global options
read -p "Enter git username: " name
read -p "Enter git email " email
git config --global user.name $name
git config --global user.email $email
git config --global pull.rebase true

echo "Changing shell to zsh"
chsh -s /usr/bin/zsh

echo "Install finished. Please log out to start using zsh"

exit 0
