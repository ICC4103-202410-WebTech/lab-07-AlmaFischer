# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# Clear existing records
User.destroy_all
Post.destroy_all
Tag.destroy_all
PostTag.destroy_all

# Create users including John Doe
john_doe = User.create!(
  name: "John Doe",
  email: "john@example.com",
  password: "password"
)

4.times do |i|
  User.create!(
    name: "User #{i+2}",
    email: "user#{i+2}@example.com",
    password: "password#{i+2}"
  )
end

# Create tags
tags = []
5.times do |i|
  tags << Tag.create!(name: "Tag #{i+1}")
end

# Create posts with tags
john_doe.posts.create!(
  title: "Post 1",
  content: "Content of post 1"
).tags << tags.sample

User.where.not(id: john_doe.id).each do |user|
  2.times do |i|
    post = user.posts.create!(
      title: "Post #{i+1}",
      content: "Content of post #{i+1}"
    )
    post.tags << tags.sample
  end
end


john_doe = User.create!(
  name: "John Doe",
  email: "john@example.com",
  password: "password"
)

4.times do |i|
  User.create!(
    name: "User #{i+2}",
    email: "user#{i+2}@example.com",
    password: "password#{i+2}"
  )
end

# Create tags
tags = []
5.times do |i|
  tags << Tag.create!(name: "Tag #{i+1}")
end

# Create posts with tags
john_doe.posts.create!(
  title: "Post 1",
  content: "Content of post 1"
).tags << tags.sample

User.where.not(id: john_doe.id).each do |user|
  2.times do |i|
    post = user.posts.create!(
      title: "Post #{i+1}",
      content: "Content of post #{i+1}"
    )
    post.tags << tags.sample
  end
end