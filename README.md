Neovim setup
=========
#### Install
##### Arch

sudo pacman -S python2-neovim python-neovim

yaourt -S ruby-neovim tidy-html5 xclip go

yaourt -S flake8

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

go get -u github.com/nsf/gocode && go get -u github.com/golang/lint/golint


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
