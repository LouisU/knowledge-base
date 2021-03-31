vimwiki
--------
Some configurations I'm using.

```
" Change the default wiki folder, Change the 'path' to '~/knowledge-base/'
" Custom index page name as README, Set the 'index' to 'README'
" Change the default file type, Change the 'syntax' to 'markdonw'
" Change the default ext, Change the 'ext' to '.md'
let g:vimwiki_list = [{'path': '~/knowledge-base/', 'index': 'README',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" vimwiki would treat every file with configured file-extension as a wiki.
" To disable this feature add g:vimwiki_global_ext=0
let g:vimwiki_global_ext = 0

```





Usage of vimwiki

When I have mutiple folders in vimwiki_list as below
```
let g:vimwiki_list = [{'path': '~/knowledge-base/', 'index': 'README',
                      \ 'syntax': 'markdown', 'ext': '.md'},
		      \ {'path': '~/news-base/', 'index': 'README',
		      \ 'syntax': 'markdown', 'ext': '.md'}]
```
then need add a number in command which enter vimwiki
```
0<leader>ww
1<leader>ww
```
default 0<leader>ww will enter the first custom wiki(~/knowledge-base/README.md).




Problem:
1. When create a link to another md file, the extension(.md) would not add into the link.
