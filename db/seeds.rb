User.destroy_all
Twist.destroy_all
Comment.destroy_all
Relationship.destroy_all


User.create!([
  {name: "john", email: "john@gmail.com", password: "chicken", password_confirmation: "chicken", admin: false, image: nil},
  {name: "bob", email: "bob@gmail.com", password: "chicken", password_confirmation: "chicken", admin: false, image: nil},
  {name: "peter", email: "peter@gmail.com", password: "chicken", password_confirmation: "chicken",  admin: false, image: nil}
])

Twist.create!([
  {content: "Salut", user_id: User.first.id},
  {content: "Salut", user_id: User.first.id},
  {content: "alknalkna", user_id: User.first.id},
  {content: "hola", user_id: User.first.id},
  {content: "its Peter Pearson", user_id: User.last.id},
  {content: "test twist_params and they work!", user_id: User.last.id}
])

Comment.create!([
  {comment: "hey bb", twist_id: Twist.first.id, user_id: User.last.id},
  {comment: "salut", twist_id: Twist.last.id, user_id: User.last.id},
  {comment: "salut", twist_id: Twist.first.id, user_id: User.last.id}
])

Relationship.create!([
  {follower_id: User.first.id, followed_id: User.last.id},
  {follower_id: User.last.id, followed_id: User.first.id}
])