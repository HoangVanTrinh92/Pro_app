User.create!(email: "example@railstutorial.org",
             password:              "12345678",
             password_confirmation: "12345678",
             role: "admin")

50.times do |n|
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(email: email,
               password:              password,
               password_confirmation: password,
               role: "normal")
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
