" inline-python.vim

" check python dependencies
if !has('python3')
    echo 'Vim needs to be compiled with +python support'
    finish
endif

if exists('g:ip_loaded')
    finish
endif

" for checking if the plugin is already loaded
let g:ip_loaded = 1

" local variables
let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" global variables
" append takes the prev. line content and only appends the python result
" nextline writes the result to the next line of the buffer
" div_str is used as a divider if the append option is used

let s:append = get(g:, 'ip_append', 0)
let s:nextline = get(g:, 'ip_use_nextline', 0)
let s:div_str = get(g:, 'ip_divider_str', '')


" Python snippet to import the python script from the plugin dir
" Credits: https://candidtim.github.io/vim/2017/08/11/write-vim-plugin-in-python.html

python3 << EOF
import sys
from os.path import normpath, join
import vim
plugin_root_dir = vim.eval('s:plugin_root_dir')
python_root_dir = normpath(join(plugin_root_dir, '..', 'plugin'))
sys.path.insert(0, python_root_dir)
from inline import *
EOF


" Global Vim Func.
function! EvalPython()
    python3 eval_current_line()
endfunction

" Make it available as command
command! -nargs=0 EvalPython call EvalPython()

