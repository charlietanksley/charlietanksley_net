def my_contributions
  {"thumblemonks/riot"=>[{:sha=>"1b90c5e", :date=>"2011-09-13", :subject=>"remove mention of deprecated exists from README", :body=>""}, {:sha=>"7201941", :date=>"2011-09-13", :subject=>"add deprecation warning to exists macro", :body=>""}, {:sha=>"cc99cd9", :date=>"2011-09-03", :subject=>"remove mention of any macro from README", :body=>""}, {:sha=>"9b1510c", :date=>"2011-09-03", :subject=>"add deprecation warning to any macro", :body=>""}, {:sha=>"3877864", :date=>"2011-09-03", :subject=>"remove discussion of not! from README.", :body=>""}, {:sha=>"64bc72f", :date=>"2011-08-22", :subject=>"remove depreciated not! assertion macro", :body=>""}], "rubinius/rubinius"=>[{:sha=>"e804060", :date=>"2011-10-15", :subject=>"update String#squeeze and #squeeze! specs for 19", :body=>"To do this I needed to:\n\n* clarify wording in String#squeeze spec description\n* clarify wording in String#squeeze! spec\n* add spec for String#squeeze! for 1.9\n* add spec for String#squeeze! in 1.8"}, {:sha=>"7acb876", :date=>"2011-10-15", :subject=>"patch String#squeeze for 19", :body=>"String#squeeze should throw an ArgumentError when given a bad range\n(e.g., 'e-b').\n\nSince String#squeeze and String#squeeze! should both throw an\nArgumentError when the range argument is backward, I moved the error\ninto the String#squeeze! method and removed it from the String#squeeze\nmethod (which is defined in terms of the banged method)."}], "davetron5000/methadone"=>[{:sha=>"998ec00", :date=>"2012-01-22", :subject=>"add features to ensure gemspec consistency", :body=>""}, {:sha=>"0cc4b68", :date=>"2012-01-21", :subject=>"update gemspec dependencies due to bundler changes", :body=>"By default, the gemspec block variable is now gem.  Use that to avoid\nbreaking bundler."}]}
end

def contribution_entry(hash)
  [hash[:date], hash[:subject], "(#{hash[:sha]})"].join(' ')
end

def print_em
  my_contributions.each_pair do |repo_name, commit|
    puts repo_name
    puts "\\begin{itemize}"
    commit.each do |c|
      puts "\\item" + contribution_entry(c)
    end
    puts "\\end{itemize}"
    puts
  end
end

print_em
