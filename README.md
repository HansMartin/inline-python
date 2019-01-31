# inline-python

Run/Interpret python code inline in a vim buffer.


### Installation

Use your favorite Vim plugin Manager to install inline-python.

Eg. using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'hansmartin/inline-python'
```


### Configuration

following variables can be set (+ the default value)

* g:ip_append=0
* g:ip_use_nextline=0
* g:ip_divider_str=""

**g:ip_append**

If this value is 0, the content of the current line is overwritten.

**g:ip_use_nextline**

If this settings is set to 1, the result of the evaluation is written to the next line.

**g:ip_divider_str**

This settings is can be used if a divider between the expression and the result is needed.

For Example:

```
set g:ip_divider_str = ' ~ [py]: '

1+1  ~ [py]: 2
```

### Usage:

Enter a valid python-expression in vim and execute ```:EvalPython```. This will evaluate the python expression and writes
the result into the current/next line, depending on the settings used.




