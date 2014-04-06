# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ruby encoding: utf-8
User.create([
  {:email => 'markus@rieder.ie', :password => '12345678'},
  {:email => 'mikesch@cat.ie', :password => '12345678'},
  {:email => 'user1@rail.com', :password => '12345678'},
  {:email => 'user2@rail.com', :password => '12345678'},
  {:email => 'user3@rail.com', :password => '12345678'},
  {:email => 'user4@rail.com',:password =>'12345678'},
  {:email => 'user5@rail.com',:password =>'12345678'},
  {:email => 'user6@rail.com',:password =>'12345678'},
  {:email => 'user7@rail.com',:password =>'12345678'},
  {:email => 'user8@rail.com',:password =>'12345678'},
  {:email => 'user9@rail.com',:password =>'12345678'},
  {:email => 'user10@rail.com',:password =>'12345678'}])

Book.create([
  {:title=> 'The Lord of the Rings: Fellowship of the Ring', :author=>'J.R.R Tolkien', :isbn=>'9784566023642',:genre=>'Fantasy',:shelf=>'Fantasy',:user_id=>'1'},
  {:title=> 'The Lord of the Rings: The Two Towers', :author => 'J.R.R Tolkien', :isbn => '9780007269716',:genre=>'Fantasy',:shelf=>'Fantasy',:user_id=>'1'},
  {:title=> 'The Lord of the Rings: The Return of the King', :author => 'J.R.R Tolkien', :isbn => '9780618260249',:genre => 'Fantasy',:shelf => 'Fantasy',:user_id => '1'},
  {:title=> 'Destination Void', :author => 'Frank Herbert', :isbn => '9780425055373',:genre=>'Fantasy',:shelf=>'Fantasy',:user_id=>'1'},
  {:title=> 'Cats are intelligent', :author=>'Mikesch The Cat', :isbn=>'9780140020236',:genre=>'Novel',:shelf=>'Cats',:user_id=>'1'},
  {:title=> 'Cats are intelligent', :author=>'Mikesch The Cat', :isbn=>'9780140020236',:genre=>'Novel',:shelf=>'Cats',:user_id=>'2'},
  {:title=> 'The Cat', :author=>'Georges Simenon', :isbn=>'9780156155496',:genre=>'Novel',:shelf=>'Simenon',:user_id=>'1'}])
