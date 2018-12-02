" inline-python.vim

" check python dependencies
if !has('python')
    echo 'Vim needs to be compiled with +python support'
endif


" local variables
let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')


" global variables
" append takes the prev. line content and only appends the python result
" nextline writes the result to the next line of the buffer
" div_str is used as a devider if the append option is used

let s:append = get(g:, 'ip_append', 0)
let s:nextline = get(g:, 'ip_use_nextline', 0)
let s:div_str = get(g:, 'ip_divider_str', '')


" Python snippet to import the python script from the plugin dir
" Credits: https://candidtim.github.io/vim/2017/08/11/write-vim-plugin-in-python.html

python << EOF
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
    python eval_current_line()
endfunction

" Make it available as command
command! -nargs=0 EvalPython call EvalPython()


