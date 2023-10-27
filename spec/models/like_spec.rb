# spec/models/like_spec.rb
require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(Name: 'YourName', Bio: 'Your Bio', Photo: 'URL_to_your_photo')
    post = Post.create(Title: 'Hello rails', Text: 'Hello', author: user)
    like = Like.new(user:, post:)
    expect(like).to be_valid
  end

  it "updates the post's Likes_counter after saving" do
    user = User.create(Name: 'YourName', Bio: 'Your Bio', Photo: 'URL_to_your_photo')
    post = Post.create(Title: 'Hello rails', Text: 'Hello', author: user)
    Like.create(user:, post:)

    post.reload
    expect(post.Likes_counter).to eq(1)
  end
end
