require 'rails_helper'

describe UsersController, type: :request do
  describe 'GET #index' do
    it 'respond with Success form the controller#action index' do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it 'Renders the index template from views' do
      get '/users'
      expect(response).to render_template('users/index')
      expect(response).to render_template(layout: 'layouts/application')
    end

    it 'response body includes correct placeholder text from index' do
      get '/users'
      expect(response.body).to include('LIST OF USERS')
    end
  end

  describe 'GET #show' do
    it 'respond with the success from the controller#action show' do
      get user_path(:id)
      expect(response).to have_http_status(:success)
    end

    it 'Renders the show tempalate from views' do
      get user_path(:id)
      expect(response).to render_template('users/show')
      expect(response).to render_template(layout: 'layouts/application')
    end

    it 'response body includes correct placeholder text from show' do
      get user_path(:id)
      expect(response.body).to include('DISPLAY SPECIFIC USER')
    end
  end
end
