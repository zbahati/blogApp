# spec/models/post_spec.rb
require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(Name: 'YourName', Bio: 'Your Bio', Photo: 'URL_to_your_photo')
    post = Post.new(Title: 'Hello rails', Text: 'Hello', author: user)
    expect(post).to be_valid
  end

  it 'is not valid without a Title' do
    post = Post.new(Text: 'Hello')
    expect(post).to_not be_valid
  end

  it "updates the user's post counter after saving" do
    user = User.create(Name: 'YourName', Bio: 'Your Bio', Photo: 'URL_to_your_photo')
    Post.create(Title: 'Hello rails', Text: 'Hello', author: user)

    expect(user.Posts_counter).to eq(1)
  end

  it 'returns the five most recent comments for the post' do
    user = User.create(Name: 'YourName', Bio: 'Your Bio', Photo: 'URL_to_your_photo')
    post = Post.create(Title: 'Hello rails', Text: 'Hello', author: user)

    comment1 = Comment.create(Text: 'Comment 1', user:, post:)
    comment2 = Comment.create(Text: 'Comment 2', user:, post:)
    comment3 = Comment.create(Text: 'Comment 3', user:, post:)
    comment4 = Comment.create(Text: 'Comment 4', user:, post:)
    comment5 = Comment.create(Text: 'Comment 5', user:, post:)
    recent_comments = post.five_recent_comments

    expect(recent_comments).to eq([comment5, comment4, comment3, comment2, comment1])
  end
end
