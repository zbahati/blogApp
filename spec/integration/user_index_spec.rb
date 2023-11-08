# require 'rails_helper'

# RSpec.feature 'User Index', type: :feature do
#   scenario 'visiting the user index page' do
#     User.create(Name: 'Okari', Photo: 'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png')
#     User.create(Name: 'Nyandika', Photo: 'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png')

#     visit users_path

#     expect(page).to have_content('Okari')
#     expect(page).to have_content('Nyandika')
#     expect(page).to_not have_css("img[alt*='avatar']", count: 2)
#   end

#   scenario 'visiting the user index page, you see the number of posts each user has written..' do
#     first_post = Post.create(Title: 'Hello', Text: 'This is my first post')
#     second_post = Post.create(Title: 'Hello', Text: 'This is my first post')
#     third_post = Post.create(Title: 'Hello', Text: 'This is my first post')

#     visit users_path

#     expect(page).to have_content('3')
#   end

#   it 'redirects when clicked on a user' do
#     user = User.create(Name: 'Salim')

#     visit users_path

#     click_link 'Salim'
#     expect(page).to have_current_path(user_path(user))
#   end
# end
