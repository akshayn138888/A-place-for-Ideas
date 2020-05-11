# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Like.delete_all 
Review.delete_all 
Idea.delete_all
User.delete_all

NUM_IDEA = 200
NUM_USER = 10
PASSWORD = 'supersecret'



super_user = User.create(
    name: 'Jon Snow',
    email: 'js@winterfell.gov',
    password: PASSWORD
)
NUM_USER.times do
    name = Faker::Name.name  
    User.create(
       name: name,
       email: Faker::Internet.email,
       password: PASSWORD
    )
end



users = User.all # array of user records


NUM_IDEA.times do 
    created_at = Faker::Date.backward(days: 365 * 5)
    q = Idea.create(
        title: Faker::Hacker.say_something_smart,
        description: Faker::ChuckNorris.fact,
        user: users.sample, # array method that randomly picks something from an array
        created_at: created_at,
        updated_at: created_at
    )
    if q.valid? 
        q.reviews = rand(0..15).times.map do 
          Review.new(body: Faker::GreekPhilosophers.quote, user: users.sample)
        end
    end
    q.likers = users.shuffle.slice(0, rand(users.count))
end

Idea = Idea.all 
review = Review.all

puts Cowsay.say("Generated #{Like.count} likes", :ghostbusters)
puts Cowsay.say("Generated #{Idea.count} Ideas", :frogs)
puts Cowsay.say("Generated #{Review.count} answers", :tux)
puts Cowsay.say("Generated #{users.count} users", :sheep)