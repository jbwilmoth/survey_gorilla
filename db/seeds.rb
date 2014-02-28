require 'faker'
fake_email = Faker::Internet::email

5.times { User.create(email: fake_email) }

