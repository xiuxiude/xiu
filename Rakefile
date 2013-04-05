require 'nanoc3/tasks'

desc "Clean compiled site"
task :clean do
  `rm -rf output/`
end

desc "Compile the site"
task :compile => [:clean] do
  `nanoc compile`
end

desc "Deploy to server"
task :deploy => [:compile] do
  `nanoc deploy --target public`
end