
require 'rails_helper'

RSpec.feature 'Post Index', type: :feature do
  let!(:user) { User.create(Name: 'Tom', Photo: 'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png', Bio: 'He is a good programmer') }
  let!(:post) { Post.create(author: user, Title: "first post's title", Text: 'first text') }
  let!(:comment) { Comment.create(user: user, post: post, Text: 'first comment') }
  let!(:like1) { Like.create(post: post, user: user) }

  scenario "see user's profile picture, username, number of posts, and interactions" do
    visit user_posts_path(user)
    expect(page).to have_content('Tom')
    expect(page).to have_css("img[src='https://www.kasandbox.org/programming-images/avatars/leaf-blue.png']")
    expect(page).to have_content('Number of Posts:')
    expect(page).to have_content('Pagination')
  end

  scenario "see some of the post's  body, and first comments" do
    visit user_post_path(user, post, comment )  # Ensure you are on the correct page
    expect(page).to have_content('first comment')  # Check for the correct post body
  end

  scenario 'see a section for pagination if there are more posts than fit on the view' do
    visit user_posts_path(user)
    expect(page).to have_content('Pagination')
  end

  scenario "clicking on a post redirects me to that post's show page" do
    visit user_post_path(user, post)
    expect(page).to have_current_path(user_post_path(user, post))
  end
end
