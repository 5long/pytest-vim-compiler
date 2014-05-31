" Vim compiler file
" Compiler: Py.test <http://pytest.org/>
" Maintainer: Whyme Lyu <5longluna at gmail.com>
" URL: https://github.com/5long/pytest-vim-compiler
" Last change  by: Arthur Jaron <hifreeo@gmail.com>
" Last change: 30.11.2013

if exists("current_compiler")
  finish
endif
let current_compiler = "pytest-3"

if exists(":CompilerSet") != 2 " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=py.test-3.3\ --tb=short\ -q

CompilerSet errorformat=
    \%-G%.%#FF%.%#,
    \%-G=%#\ FAILURES\ =%#,
    \%A_%#\ %m\ _%#,
    \%C%f:%l:%.%#,
    \%C>\ %#self%.%m,
    \%C>\ %#%m,
    \%ZE\ %#%m,
    \%-G%.%#seconds%.%#,
    \%-G%.%#

" Default unittest assertion always contain "self.", which can easily be
" stripped for a clearer (shorter) quickfix output.

let &cpo = s:cpo_save
unlet s:cpo_save
