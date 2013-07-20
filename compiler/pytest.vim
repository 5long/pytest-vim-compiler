" Vim compiler file
" Compiler: Py.test <http://pytest.org/>
" Maintainer: Whyme Lyu <5longluna at gmail.com>
" URL: https://github.com/5long/pytest-vim-compiler
" Version: 0.4.0

if exists("current_compiler")
  finish
endif
let current_compiler = "pytest"

if exists(":CompilerSet") != 2 " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=py.test\ --tb=short\ -q

CompilerSet errorformat=
  \%+G%*[_]\ %m\ %*[_],
  \%E%>%f:%l:\ %.%#,
  \%-Z>%*[\ ]%m,
  \%-G%.%#

let &cpo = s:cpo_save
unlet s:cpo_save
