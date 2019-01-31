import vim

'''
    evaluates the current line from the vim buffer
    if the g:append var is set: the result is appended to the line
    if the g:next_line is set, the result is written to the nextline
'''
def eval_current_line():

    # getting the python code from current line
    row, col = vim.current.window.cursor
    pycode = vim.current.buffer[row-1]
    pre_str = ''

    # eval the python code
    try:
        result = eval(pycode.strip(), globals())
    except:
        result = '<python-eval-error>'

    # checking the global vim variables
    if vim.eval('s:nextline') == '1':
        if row == len(vim.current.buffer):
            vim.current.buffer.append('')
        row += 1

    if vim.eval('s:append') == '1':
        pre_str = vim.current.buffer[row-1] + vim.eval('s:div_str')

    # replacing the vim buffer
    vim.current.buffer[row-1] = pre_str + str(result)
