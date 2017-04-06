Neovim setup
=========
#### Install
##### Arch
```
sudo pacman -S python2-neovim python-neovim

# Depending on your package manager for the AUR
yaourt -S ruby-neovim tidy-html5 xclip go flake8

```
##### Ubuntu

```
#!/bin/bash

# Check if user is root
if [ $(id -u) != "0" ]; then
    echo "Error: You must be root to run this script, please use root to install the software."
    exit 1
fi

apt-get install software-properties-common
apt-get install python-dev python-pip python3-dev python3-pip xclip git-core automake libtool cmake python-dev python-pip python3-dev
apt-get install python3-setuptools
add-apt-repository ppa:neovim-ppa/stable
apt-get update
apt-get install neovim
apt install flake8
# and possibly run the below if you are receiving errors about compiling with python
easy_install3 pip
pip2 install --upgrade neovim

# install tidy-html5

mkdir /tmp/htmltidy
cd /tmp/htmltidy
git clone https://github.com/w3c/tidy-html5
cd tidy-html5
cmake ../.. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
make
sudo make install

rm /tmp/htmltidy -rf
```

##### Everything else

https://github.com/neovim/neovim/wiki/Installing-Neovim

##### Go

Create GOPATH and add to PATH
I used
```
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
```

install gocode and go lint

```
go get -u github.com/nsf/gocode && go get -u github.com/golang/lint/golint
go get -u -ldflags -H=windowsgui github.com/nsf/gocode
```
#### Requirements

* Your Vim must have Ruby support enabled. Check if :echo has('ruby') prints 1.
* If you see LoadError on :ruby require 'json/pure', you need to install json_pure gem.

#### Copy and paste this into terminal
```
cd ~/.config/ && git clone https://github.com/ctaperts/neovim_init.vim.git nvim && cd nvim/bundle/ && git clone https://github.com/Valloric/YouCompleteMe.git && cd YouCompleteMe/ && git submodule update --init --recursive && ./install.py
```

#### Then install Plugs, type :q(return) twice to exit
nvim -c PlugInstall

#### Setup Github Dashboard
[Instruction to setup github token](https://help.github.com/articles/creating-an-access-token-for-command-line-use/)

add to bashrc 

```
export GITHUB_USERNAME="<username>"
export GITHUB_TOKEN="<github token>"
```

Options
------
* ctrl-e - open netrw
* ctrl-s - open startify
* ctrl-w - write to file
* ctrl-q - exit vim
* ctrl-l - run FZF search
* ctrl-c - setup find and replace :s%/from/to/g
* ctrl-v - Github activity
* ctrl-m - run code (Make is setup for python)
* enter  - run code (Make is setup for python)

Info
-----
Includes:
* [fzf](https://github.com/junegunn/fzf.vim)
* [vim-rake](https://github.com/tpope/vim-rake)
* [vim-startify](https://github.com/mhinz/vim-startify)
* [lightline.vim](https://github.com/itchyny/lightline.vim)
* [vim-github-dashboard](https://github.com/junegunn/vim-github-dashboard)
* [YouCompleteMe](https://valloric.github.io/YouCompleteMe/)
* [syntastic](https://github.com/scrooloose/syntastic)
* [vim-colorschemes](https://github.com/flazz/vim-colorschemes)
* [vim-lastplace](https://github.com/dietsche/vim-lastplace)
* [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides) (only works in gvim)
* [vim-rails](https://github.com/tpope/vim-rails)
