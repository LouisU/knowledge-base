neovim
--------
## vimrc file I'm using

Neovim build-in settings
```
" set line number
set number

" you'll change the output encoding that is shown in the terminal.
set encoding=utf-8 

" set neovim not compatible with vim
set nocompatible 
```


Key mappings
```
" set for leader
let mapleader=','

" save the change in insert mode and normal mode.
inoremap <leader>w <Esc>:w<cr>
noremap <leader>W :w<cr>

" setting :source % as a easy way
nnoremap <leader>s :source %<cr>

" set backgroud Transparent
hi Normal ctermfg=252 ctermbg=none

" show the current mode(normal\insert\visual\command)
" no need to set this if you have plug like vim-airline
set showmode

" set Up Down Left Right to do nothing.
inoremap <Up> <Nop>
noremap <Up> <Nop>
inoremap <Down> <Nop>
noremap <Down> <Nop>
inoremap <Left> <Nop>
noremap <Left> <Nop>
inoremap <Right> <Nop>
noremap <Right> <Nop>

" set Esc to do nothing
inoremap <Esc> <Nop>
vnoremap jk <Esc>
inoremap jk <Esc>

" set zz to exit file
noremap zz :q!<cr>

" set < to go to the first letter in the current line
noremap < ^

" set > to go to the last letter in the current line
noremap > $


" use ctrl+hjkl switch window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

```

```
" Functions
```
```
" Plugs -- install uninstall 
```

```
" () Plug usages
```



## vimrc settings backup
```
set fileencoding=utf-8 " you'll change the output encoding of the file that is written.
<++>
```


## vim basic operations
#### Normal Mode
1. u     undo last change.
2. ctrl + r  redo changes which were undone.
3. 

#### Visualize Mode

#### Insert Mode

#### Command Mode

1. ctrl+f  we can check the history of commands.
2. ctrl+f :q   After we get in command history, can quit out by typei n :q.
3. 


