namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    Project.create!(:title => "Example Project")

    40.times do |n|
      title = Faker::Company.name
      Project.create!(:title => title)
    end
  end
end
