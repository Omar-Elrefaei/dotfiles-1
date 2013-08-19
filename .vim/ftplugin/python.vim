" normally: autocmd FileType python
setlocal shiftwidth=4 tabstop=4 softtabstop=4
setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class

" enable debugging
if filereadable("~/.vim/ftplugin/vimpdb/VimPdb.vim")
  "source ~/.vim/ftplugin/vimpdb/VimPdb.vim
endif

" Highlight everything possible for python
let g:python_highlight_all=1 

" Pyflakes should not use the quickfix window:
let g:pyflakes_use_quickfix = 0

" ---------------------------------------------------------
" Add the virtualenv's site-packages to vim path
if exists("g:python_did_virtualenv")
    finish
endif

let g:python_did_virtualenv = 1

if !exists("$VIRTUAL_ENV")
    finish
endif

python << EOF
import os.path
import sys
import vim
project_base_dir = os.environ['VIRTUAL_ENV']
sys.path.insert(0, project_base_dir)
activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
execfile(activate_this, dict(__file__=activate_this))
EOF
