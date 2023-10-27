# spec/models/comment_spec.rb
require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(Name: 'YourName', Bio: 'Your Bio', Photo: 'URL_to_your_photo')
    post = Post.create(Title: 'Hello rails', Text: 'Hello', author: user)
    comment = Comment.new(Text: 'How we are going to do this', user:, post:)
    expect(comment).to be_valid
  end

  it 'is not valid without Text' do
    comment = Comment.new
    expect(comment).to_not be_valid
  end

  it "updates the post's Comments_counter after saving" do
    user = User.create(Name: 'YourName', Bio: 'Your Bio', Photo: 'URL_to_your_photo')
    post = Post.create(Title: 'Hello rails', Text: 'Hello', author: user)
    Comment.create(Text: 'How we are going to do this', user:, post:)
    post.reload

    expect(post.Comments_counter).to eq(1)
  end
end
