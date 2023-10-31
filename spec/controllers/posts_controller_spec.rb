require 'rails_helper'

describe PostsController, type: :request do
  describe 'GET #index' do
    it 'respond with Success form the controller#action index' do
      get user_posts_path(:user_id)
      expect(response).to have_http_status(:success)
    end

    it 'Renders the index template from views' do
      get user_posts_path(:user_id)
      expect(response).to render_template('posts/index')
      expect(response).to render_template(layout: 'layouts/application')
    end

    it 'response body includes correct placeholder text from index' do
      get user_posts_path(:id)
      expect(response.body).to include('LISTS OF THE POSTS TO THE SPECIFIC USER')
    end
  end

  describe 'GET #show' do
    it 'respond with the success from the controller#action show' do
      get user_post_path(:user_id, :id)
      expect(response).to have_http_status(:success)
    end

    it 'Renders the show tempalate from views' do
      get user_post_path(:user_id, :id)
      expect(response).to render_template('posts/show')
      expect(response).to render_template(layout: 'layouts/application')
    end

    it 'response body includes correct placeholder text from show' do
      get user_post_path(:user_id, :id)
      expect(response.body).to include('HERE IS THE PAGE FOR  DISPLAYING  A SPECIFIC POST TO THE SPECIFIC USER')
    end
  end
end
