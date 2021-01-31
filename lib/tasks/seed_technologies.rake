require 'seed_technologies'

desc "Seeding technologies"
task :seed_technologies => [:environment] do
  SeedTechnologies.seed
  puts "Finished seeding technologies"
end
