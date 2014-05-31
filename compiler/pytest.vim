" Vim compiler file
" Compiler: Py.test <http://pytest.org/>
" Maintainer: Whyme Lyu <5longluna at gmail.com>
" URL: https://github.com/5long/pytest-vim-compiler
" Last change by: Arthur Jaron <hifreeo@gmail.com>
" Last change: 31.05.2014 

if exists("current_compiler")
  finish
endif

if has("python3") && has("python2")
  CompilerSet makeprg=py.test-3.4\ --tb=short\ -q
elseif !has("python3") && has("python2")
  CompilerSet makeprg=py.test-2.7\ --tb=short\ -q
endif

let current_compiler = "pytest"

if exists(":CompilerSet") != 2 " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

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
