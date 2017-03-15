require 'rails_helper'

describe RecordsController do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) { sign_in user }

  it 'GET index' do
    get :index
    expect(response).to have_http_status 200
  end

  it 'POST create' do
    post :create, params: { record: {}, format: :js }
    expect(response).to redirect_to records_url
  end

  it 'PUT update' do
    started_record = user.records.create(started_at: Time.now)
    put :update, params: { id: started_record.id, record: {}, format: :js }
    expect(response).to redirect_to records_url
  end

  context 'view response' do
    render_views

    it 'GET index' do
      finished_record = user.records.create(started_at: Time.now, finished_at: Time.now + 8.hours)
      get :index
      expect(response.body).to match finished_record.started_at.strftime('%d %B %Y %H:%M:%S')
      expect(response.body).to match finished_record.finished_at.strftime('%d %B %Y %H:%M:%S')
    end
  end

  context 'raise error' do

    it 'twice create record' do
      post :create, params: { record: {}, format: :js }
      post :create, params: { record: {}, format: :js }
      expect(response).to redirect_to records_url
      expect(flash[:error]).to match 'You have already started to work'
    end

    it 'twice update record' do
      started_record = user.records.create(started_at: Time.now)
      put :update, params: { id: started_record.id, record: {}, format: :js }
      put :update, params: { id: started_record.id, record: {}, format: :js }
      expect(response).to redirect_to records_url
      expect(flash[:error]).to match 'You have already finished to work'
    end

  end

end
