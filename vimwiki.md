vimwiki
--------
Some configurations I'm using.

```
" Change the default wiki folder, Change the 'path' to '~/knowledge-base/'
" Custom index page name as README, Set the 'index' to 'README'
" Change the default file type, Change the 'syntax' to 'markdonw'
" Change the default ext, Change the 'ext' to '.md'
" Replace space as '-', set 'links_space_char' as below.
let g:vimwiki_list = [{'path': '~/knowledge-base/', 'index': 'README',
                      \ 'syntax': 'markdown', 'ext': '.md'
		      \ 'links_space_char': '- 
		      }]

" vimwiki would treat every file with configured file-extension as a wiki.
" To disable this feature add g:vimwiki_global_ext=0
let g:vimwiki_global_ext = 0


" Make every auto link generates by vimwiki to markdown file include extension .md, set vimwiki_markdown_link_ext
let g:vimwiki_markdown_link_ext=1

" Link also can be subdirectory file, just use path/to/subdirectory/xxx.md
" vimwiki_dir_link is a controller that tell vimwiki wheret to jump when visit a subdirectory. 
" Value           Description~
" ''              Open 'directory/' using the standard netrw plugin.
" 'index'         Open 'directory/index.wiki', create if needed.
" 'main'          Open 'directory/main.wiki', create if needed.
" etc.
" 
" Default: '' (empty string)
" 
let g:vimwiki_dir_link=''
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

### Normal Mode
=  can make a line become the top title
== can make a line become secondary title
\- can make a title level upgrade


Problem:
1. When create a link to another md file, the extension(.md) would not add into the link.(Solved)
