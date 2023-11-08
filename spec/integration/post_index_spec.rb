# require 'rails_helper'

# RSpec.feature 'Post Index', type: :feature do
#   let(:user) { User.create(Name: 'Tom', Photo: 'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png', Bio: 'He is a good programmar') }
#   let!(:post) { Post.create(Title: "first post's title", Text: 'first text') }
#   let!(:comment1) { Comment.create(post:, Text: 'first comment') }
#   let!(:comment2) { Comment.create(post:, Text: 'second comment') }
#   let!(:comment3) { Comment.create(post:, Text: 'third comment') }
#   let!(:like1) { Like.create(post:) }

#   scenario "see user's profile picture, username, number of posts and interactions" do
#     visit user_posts_path(user)
#     expect(page).to have_content('Tom')
#     expect(page).to_not have_css("img[alt='Tom']", count: 1)
#     expect(page).to have_content('Number of Posts:')
#     expect(page).to have_content('Pagination')
#   end

#   scenario "see some of the post's title, body and first comments" do
#     visit user_posts_path(user)
#     expect(page).to have_content('Tom')
#     expect(page).to have_content('Number')
#     expect(page).to have_content("Pagination")
#   end

#   scenario 'see a section for pagination if there are more posts than fit on the view' do
#     visit user_posts_path(user)
#     expect(page).to have_content('Pagination')
#   end

#   scenario "clicking on a post, it redirects me to that post's show page" do
#     visit user_posts_path(user)
#     click_link "first post's title"
#     expect(page).to have_current_path(user_post_path(user, post))
#   end
# end
