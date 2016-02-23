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
  {content: "Bonjour, Do you like cheese?", user_id: User.first.id},
  {content: "How is it possible to not like cheese?", user_id: User.first.id},
  {content: "Cheese forever", user_id: User.first.id},
  {content: "Bread also", user_id: User.first.id},
  {content: "What's going on with the cheese and bread?", user_id: User.last.id},
  {content: "I think so I cheese;)", user_id: User.last.id}
])

Comment.create!([
  {comment: "Cheese or not cheese?", twist_id: Twist.first.id, user_id: User.last.id},
  {comment: "Do you believe in the cheese evolution theory?", twist_id: Twist.last.id, user_id: User.last.id},
  {comment: "E=bread*cheese**2", twist_id: Twist.first.id, user_id: User.last.id}
])

Relationship.create!([
  {follower_id: User.first.id, followed_id: User.last.id},
  {follower_id: User.last.id, followed_id: User.first.id}
])