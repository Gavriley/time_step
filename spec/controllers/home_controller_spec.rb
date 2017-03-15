require 'rails_helper'

describe HomeController do

  it 'GET index' do
    expect(response).to have_http_status 200
  end

end
