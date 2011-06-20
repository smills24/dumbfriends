require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
      50.times do
            Quote.create(:title => Faker::Lorem.words(1), :quote_lines_attributes => {0 => {:name => Faker::Name.first_name, :said => Faker::Lorem.sentences(3)}})
            Quote.create(:title => Faker::Lorem.words(1), :quote_lines_attributes => {0 => {:name => Faker::Name.first_name, :said => Faker::Lorem.sentences(3)}, 1 => {:name => Faker::Name.first_name, :said => Faker::Lorem.sentences(3)}})
      end
      (1..50).each do |i|
          rand(10).times do
            Comment.create(:content => Faker::Lorem.sentences(3), :quote_id => i)
	  end
      end
  end
end

