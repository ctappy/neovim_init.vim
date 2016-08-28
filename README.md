Neovim config folder install. REQUIRES Neovim with ruby
=========
#### Copy and paste this into terminal
```
cd ~/.config/ && git clone git@github.com:ctaperts/neovim_init.vim.git nvim && cd nvim/bundle/ && git clone https://github.com/Valloric/YouCompleteMe.git && cd YouCompleteMe/ && git submodule update --init --recursive && ./install.py
```

#### Then install Plugs, type :q(return) twice to exit
nvim -c PlugInstall

Options
------
* ctrl-e - open netrw
* ctrl-s - open startify
* ctrl-w - write to file
* ctrl-q - exit vim
* ctrl-l - run FZF search
* ctrl-c - setup find and replace :s%/from/to/g
* ctrl-v - Github activity

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
