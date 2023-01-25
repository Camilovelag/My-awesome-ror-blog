require 'rails_helper'

RSpec.describe 'Users', type: :request do
  it 'should send a 200 response' do
    get users_path
    expect(response).to have_http_status(200)
  end
end
