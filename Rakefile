require 'rake/clean'

FILES_TO_RELEASE = FileList[%w[
  compiler/pytest.vim
  LICENSE
]]
CLOBBER << FileList['pytest-compiler-*.zip']

desc "Generate .zip package to upload to vim.org"
task :zip do
  version = `git describe --tags`.strip
  cmd = %W[
    git archive --format=zip
    -o pytest-compiler-#{version}.zip
    #{version}
  ].concat(FILES_TO_RELEASE)
  sh(*cmd)
end
