desc "Build"
task :build do
  sh 'b/middleman build'
  sh 'git add ./'
  sh "git commit -m 'build'"
end

desc "Deploy"
task :deploy do
  puts 'Did you build and commit yet? (y/n)'

  reply = STDIN.gets.strip
  if reply == 'n' or reply == 'no'
    puts 'aborted'
    exit
  end

  sh 'git push origin'
  puts "\npushed to remote\n"
  sh 'wd deploy --to=production'
  puts "\ndeployed\n"
end
