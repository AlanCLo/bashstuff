syntax on

"Tab complete in vim using shift-tab
set incsearch
set wildmode=longest,list
inoremap <S-Tab> <Tab>
inoremap <M-Tab> <Tab>
inoremap <C-j> <ESC>
inoremap <S-Tab> <C-P>

"Tab to spaces
setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype make setlocal noexpandtab
autocmd Filetype yaml setlocal ts=2 sw=2 sts=0 expandtab
