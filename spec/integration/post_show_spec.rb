require 'rails_helper'

RSpec.feature 'Post Show', type: :feature do
  let(:user) { User.create(Name: 'Tom', Photo: 'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png', Bio: 'He is a good programmar') }
  let!(:post) { Post.create(author: user, Title: "first post's title", Text: 'first text') }
  let!(:post2) { Post.create(author: user, Title: 'second post', Text: 'second text') }
  let!(:post3) { Post.create(author: user, Title: 'third post', Text: '3 text') }
  let!(:post4) { Post.create(author: user, Title: '4 post', Text: '4 text') }
  let!(:comment1) { Comment.create(post:, Text: 'first comment') }
  let!(:comment2) { Comment.create(post:, Text: 'second comment') }
  let!(:comment3) { Comment.create(post:, Text: 'third comment') }
  let!(:like1) { Like.create(post:) }
  scenario 'see the title of the post and who wrote it and the interactions' do
    visit user_post_path(user, post)
    expect(page).to have_content("Posted")
    expect(page).to have_content('by Tom')
    expect(page).to have_content('Comments: 0')
    expect(page).to have_content('Likes: 0')
  end

  scenario "see the post's body" do
    visit user_post_path(user, post)
    expect(page).to have_content('first text')
  end

  scenario 'see the username and comment of each post' do
    user2 = User.create(Name: 'Ali')
    Comment.create(post:, Text: 'fifth comment')

    visit user_post_path(user, post)

    expect(page).to have_content('Tom')
    expect(page).to_not have_content('sixth comment')
  end
end
