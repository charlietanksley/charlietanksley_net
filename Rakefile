desc "Deploy"
task :deploy do
  sh 'git push origin'
  puts "\npushed to remote\n"
  sh 'wd deploy --to=production'
  puts "\ndeployed\n"
end
