# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(Name: 'YourName', Bio: 'Your Bio', Photo: 'URL_to_your_photo')
    expect(user).to be_valid
  end

  it 'is not valid without a Name' do
    user = User.new(Bio: 'Your Bio', Photo: 'URL_to_your_photo')
    expect(user).to_not be_valid
  end

  it 'returns the three most recent posts' do
    user = User.create(Name: 'YourName', Bio: 'Your Bio', Photo: 'URL_to_your_photo')

    # Create posts for the user
    post1 = user.posts.create(Title: 'Post 1', Text: 'This is the first post')
    post2 = user.posts.create(Title: 'Post 2', Text: 'This is the second post')
    post3 = user.posts.create(Title: 'Post 3', Text: 'This is the third post')

    # Create additional posts not associated with the user
    other_user = User.create(Name: 'Other User', Bio: 'Bio', Photo: 'URL')
    other_post = other_user.posts.create(Title: 'Other Post', Text: "This is not the user's post")

    # Call the method and expect it to return the three most recent posts
    recent_posts = user.three_most_recent_post

    expect(recent_posts).to eq([post3, post2, post1])
    expect(recent_posts).not_to include(other_post)
  end
end
