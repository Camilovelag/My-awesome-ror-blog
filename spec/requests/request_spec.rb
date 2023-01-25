require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context '#index' do
    before do
      get users_path
    end

    it 'should send a 200 response' do
      expect(response).to have_http_status(200)
    end

    it 'should render a index template' do
      expect(response).to render_template(:index)
    end

    it 'body should contain an specific text' do
      placeholder = 'Hi! I&apos;m an index users page'
      expect(response.body).to include(placeholder)
    end
  end

  context '#show' do
    before do
      get user_path(1)
    end

    it 'should send a 200 response' do
      expect(response).to have_http_status(200)
    end

    it 'should render a show template' do
      expect(response).to render_template(:show)
    end

    it 'body should contain an specific text' do
      placeholder = 'Hi! I&apos;m a show an specific user page'
      expect(response.body).to include(placeholder)
    end
  end
end
