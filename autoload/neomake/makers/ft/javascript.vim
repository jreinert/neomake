" vim: ts=4 sw=4 et

function! neomake#makers#ft#javascript#EnabledMakers() abort
    return ['jshint', 'jscs', 'eslint']
endfunction

function! neomake#makers#ft#javascript#gjslint() abort
    return {
        \ 'args': ['--nodebug_indentation', '--nosummary', '--unix_mode', '--nobeep'],
        \ 'errorformat': '%f:%l:(New Error -%\\?\%n) %m,' .
        \ '%f:%l:(-%\\?%n) %m,' .
        \ '%-G1 files checked,' .
        \ ' no errors found.,' .
        \ '%-G%.%#'
        \ }
endfunction

function! neomake#makers#ft#javascript#jshint() abort
    return {
        \ 'args': ['--verbose'],
        \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
        \ }
endfunction

function! neomake#makers#ft#javascript#jscs() abort
    return {
        \ 'args': ['--no-colors', '--reporter', 'inline'],
        \ 'errorformat': '%E%f: line %l\, col %c\, %m',
        \ }
endfunction

function! neomake#makers#ft#javascript#eslint() abort
    return {
        \ 'args': ['-f', 'compact'],
        \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
        \ '%W%f: line %l\, col %c\, Warning - %m'
        \ }
endfunction

function! neomake#makers#ft#javascript#eslint_d() abort
    return {
        \ 'args': ['-f', 'compact'],
        \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
        \ '%W%f: line %l\, col %c\, Warning - %m'
        \ }
endfunction

function! neomake#makers#ft#javascript#standard() abort
    return {
        \ 'errorformat': '%W  %f:%l:%c: %m'
        \ }
endfunction

function! neomake#makers#ft#javascript#semistandard() abort
    return {
        \ 'errorformat': '%W  %f:%l:%c: %m'
        \ }
endfunction

function! neomake#makers#ft#javascript#flow() abort
    return {
        \ 'args': ['--from=vim', '--show-all-errors'],
        \ 'errorformat': '%EFile "%f"\, line %l\, characters %c-%m,%C%m,%Z%m',
        \ 'postprocess': function('neomake#makers#ft#javascript#FlowProcess')
        \ }
endfunction

function! neomake#makers#ft#javascript#FlowProcess(entry) abort
    let l:lines = split(a:entry.text, '\n')
    if len(l:lines)
        let a:entry.text = join(l:lines[1:])
        let a:entry.length = l:lines[0] - a:entry.col + 1
    endif
endfunction

function! neomake#makers#ft#javascript#xo() abort
    return {
        \ 'args': ['--compact'],
        \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
        \ '%W%f: line %l\, col %c\, Warning - %m',
        \ }
endfunction
