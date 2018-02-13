set nocompatible              						"We want the latest Vim settings/options.

so ~/.vim/plugins.vim

syntax enable
set backspace=indent,eol,start                                          "Make backspace behave like every other editor.
let mapleader = ',' 						    	  "The default is \, but a comma is much better.
set number								"Let's activate line numbers.
set noerrorbells visualbell t_vb=               			"No damn bells!
set autowriteall                                                        "Automatically write the file when switching buffers.
set complete=.,w,b,u 							"Set our desired autocompletion matching.
set tabstop=8
set expandtab



"-------------Visuals--------------"
colorscheme atom-dark
set t_CO=256								          "Use 256 colors. This is useful for Terminal Vim.
set guifont=Fira\ Code:h14						"Set the default font family and size.
set guioptions-=e							        "We don't want Gui tabs.

set guioptions-=l                     "Disable Gui scrollbars.
set guioptions-=L
set guioptions-=r
set guioptions-=R

"We'll fake a custom left padding for each window.
hi LineNr guibg=bg
set foldcolumn=2
hi foldcolumn guibg=bg

"Get rid of ugly split borders.
hi vertsplit guifg=bg guibg=bg
set laststatus=2  "Always show status line.
set history=500		" keep 500 lines of command line history
set showcmd		" display incomplete commands
set showmatch
set nowrap
colorscheme jellybeans
highlight StatusLine ctermfg=blue ctermbg=yellow
set nofoldenable " Say no to code folding...
highlight SignColumn ctermbg=black



"-------------Search--------------"
set hlsearch								"Highlight all matched terms.
set incsearch								"Incrementally highlight, as we type.




"-------------Split Management--------------"
set splitbelow 								"Make splits default to below...
set splitright								"And to the right. This feels more natural.

"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>
nmap <leader>vs :vsplit<cr>



"-------------Mappings--------------"
"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Make NERDTree easier to toggle.
nmap <C-e> :NERDTreeToggle<cr>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<cr>
map <Leader>s :call RunNearestSpec()<cr>
map <Leader>l :call RunLastSpec()<cr>
map <Leader>a :call RunAllSpecs()<cr>

" Rubocop mapping
nmap <Leader>ra :RuboCop -a<CR>
nmap <Leader>rl :RuboCop -l<CR>




"-------------Plugins--------------"
"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"/
"/ RSpec
"/
let g:rspec_command = '!clear && bin/rspec {spec}'
let g:rspec_runner = "os_x_iterm2"

"/
" PHPUINT
"/
let g:phpunit_bin = './vendor/bin/phpunit'


"/
" PHP CS FIXER
"/
let g:php_cs_fixer_php_path = "./vendor/bin/php-cs-fixer"
let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_level = "psr2" 




"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  autocmd FileType ruby,eruby,yaml setlocal colorcolumn=80
  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?

  " PHP
  autocmd FileType php setlocal colorcolumn=120
  autocmd FileType php setlocal ai sw=4 sts=4 et
augroup END
