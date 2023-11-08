require 'rails_helper'

RSpec.feature 'User Show', type: :feature do
  let(:user) { User.create(Name: 'Tom', Photo: 'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png', Bio: 'He is a good programmar') }
  let!(:post1) { Post.create(Title: 'first post', Text: 'first text') }
  let!(:post2) { Post.create(Title: 'second post', Text: 'second text') }
  let!(:post3) { Post.create(Title: 'third post', Text: '3 text') }
  let!(:post4) { Post.create(Title: '4 post', Text: '4 text') }

  scenario 'visiting the user Show page' do
    visit user_path(user)

    expect(page).to have_content('Tom')
    expect(page).not_to have_css("img[alt='Tom']")
  end

  scenario 'visiting the user show page, you see the number of posts the user has written' do
    visit user_path(user)

    expect(page).to have_content('Number of Posts:')
  end

  scenario 'visiting the user show page, you see the 3 most recent posts and the user\'s bio' do
    visit user_path(user)

    expect(page).to have_content('He is a good programmar')
    expect(page).not_to have_content('first text')
  end

  scenario 'has a link to the user index page' do
    visit user_path(user)

    expect(page).to have_link('See all posts')
    click_link 'See all posts'
    expect(current_path).to eq(user_posts_path(user))
  end

  scenario 'clicking a user post redirects to the post show page' do
    visit user_path(user)
    click_link 'second text'
    expect(current_path).to eq(post_path(post2))
  end
end
