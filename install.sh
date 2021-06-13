#!/bin/sh

dotfiles_dir=$PWD

cat packages.txt | xargs sudo apt install -y

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
    read -p "Do you want to install oh-my-zsh? [y/n]: " yn
    case $yn in
        [Yy]* ) rm -rf ~/.oh-my-zsh
                sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
                break;;
        [Nn]* ) break;;
        * )     echo "Please answer yes or no.";;
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

echo "Install finished"
exit 0
