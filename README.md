# Hector's vim set-up
Thanks Francis.

## Prerequisite
* [NVM](https://github.com/nvm-sh/nvm) - for Node Version Management. Required for the [https://github.com/neoclide/coc.nvim](coc.nvim) plugin.
* Coc.nvim uses `yarn` to install dependencies. This requires running `npm i -g yarn`.

## Run and set-up the initial Vim packages
```bash
curl https://raw.githubusercontent.com/hectorleiva/vimrc/master/fresh-install.sh | /bin/bash
```

## Install Vim-Plug
Uses [vim-plug](https://github.com/junegunn/vim-plug) with a lot of other bundles.

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

then enter vim and run `:PlugInstall` to install the bundles
