# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

User.delete_all
user = User.new(:email => "jle@kereval.com",  :password => '123456', :nickname => "jeff")
user.save!(:validate => false)

user1 = User.new(:email => "titi@toto.com",  :password => '123456', :nickname => "titi")
user1.save!(:validate => false)

user2 = User.new(:email => "toto@gmail.com",  :password => '123456', :nickname => 'toto')
user2.save!(:validate => false)


Article.delete_all
10.times do
  title = Faker::Lorem.sentence(5)
  body = Faker::Lorem.paragraphs
  if u = user1
    u = user2
  else
    u = user1
  end
  art = Article.create(:title => title ,:body => body,:user_id => u.id)
end
