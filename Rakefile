desc "Build and deploy"
task :build_and_deploy do
  sh 'b/middleman build'
  sh 'git add .'
  message = gets.chomp
  sh "git commit -m '#{message}'"
  sh 'git push origin'
  puts "\npushed to remote\n"
  sh 'wd deploy --to=production'
  puts "\ndeployed\n"
end

desc "Deploy"
task :deploy do
  sh 'git push origin'
  puts "\npushed to remote\n"
  sh 'wd deploy --to=production'
  puts "\ndeployed\n"
end
