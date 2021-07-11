" Author: Sarthak Kumar<kumar.v.sarthak@gmail.com>
" Licence: MIT


" vim-plug plugin manager
call plug#begin('~/.vim/vim-plug/')
        " NERDTree
        Plug 'preservim/nerdtree'
        
        "NERDCommenter
        Plug 'https://github.com/preservim/nerdcommenter'
        
        " Fzf
        Plug 'https://github.com/junegunn/fzf.vim'

        " Onedark theme
        Plug 'https://github.com/joshdick/onedark.vim'
        
        " LightLine
         Plug 'itchyny/lightline.vim'

        " vim-fugitive
        Plug 'https://github.com/tpope/vim-fugitive'
        " vim-devicons
        Plug 'ryanoasis/vim-devicons'
call plug#end()


" Basic settings
set hlsearch
set incsearch
set number
set tabstop=8
set autoindent
set expandtab
set softtabstop=8
set cursorline
set showcmd
set background=dark
set wildmenu
set lazyredraw
set showmatch
set encoding=UTF-8

" Theme
colorscheme onedark

" folding
set foldenable
set foldlevelstart=4
set foldnestmax=2
nnoremap <space> za
set foldmethod=syntax

" Don't skip fake line
nnoremap h gh
nnoremap k gk

" Clear last search
command C let @/=""


" LightLine Config
set laststatus=2
set noshowmode
set ttimeout ttimeoutlen=50

let g:lightline = {
        \ 'colorscheme': 'wombat',
        \'active': {
        \        'left': [ [ 'mode', 'gitbranch', 'paste', ],
        \        [ 'readonly', 'filepath', 'modified' ] ]
        \ },
        \ 'component': {
        \       'filepath': '%-f'
        \},
        \ 'component_function': {
        \       'gitbranch': 'BranchWithIcon',
        \       'filetype': 'CFiletype',
        \       'fileformat': 'CFileformat',
        \},
        \}

  
function CFiletype()
        return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
  
function CFileformat()
        return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function BranchWithIcon()
        let b = FugitiveHead()
        return (winwidth(0) > 70 && strlen(b)) ? ('' . ' ' . b) : ''
endfunction
