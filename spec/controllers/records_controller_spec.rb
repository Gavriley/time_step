require 'rails_helper'

describe RecordsController do
  render_views

  let(:user) { FactoryGirl.create(:user) }

  before(:each) { sign_in user }

  it 'starting and finishing work' do
    post :create, params: { record: {}, format: :js }
    puts user.records.last.finished_at
    expect(response).to redirect_to records_url
    put :update, params: { id: user.records.last.id, record: {}, format: :js }
    expect(response).to redirect_to records_url
    get :index
    expect(response.body).to match user.records.last.started_at.strftime("%d %B %Y %H:%M:%S").to_s
    expect(response.body).to match user.records.last.finished_at.strftime("%d %B %Y %H:%M:%S").to_s
  end

end
