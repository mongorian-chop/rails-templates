# rails:rm_tmp_dirs
["./tmp/pids", "./tmp/sessions", "./tmp/sockets", "./tmp/cache"].each do |f|
  run("rmdir ./#{f}")
end
 
# git:hold_empty_dirs
run("find . \\( -type d -empty \\) -and \\( -not -regex ./\\.git.* \\) -exec touch {}/.gitignore \\;")
 
plugin "rspec", :git => "git://github.com/dchelimsky/rspec.git"
plugin "rspec-rails", :git => "git://github.com/dchelimsky/rspec-rails.git"
generate :rspec
plugin "i18n_generators", :git => "git://github.com/amatsuda/i18n_generators.git"

# git:rails:new_app
git :init
 
file '.gitignore', <<-CODE
log/*.log
tmp/**/*
db/*.db
db/*.sqlite3
db/schema.rb
.DS_Store
config/database.yml
CODE
 
run "cp config/database.yml config/database.yml.sample"
 
git :add => "."
 
git :commit => "-a -m 'initial commit.'"

