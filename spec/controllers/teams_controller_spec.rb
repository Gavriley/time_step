require 'rails_helper'

describe TeamsController do
  let(:manager) { FactoryGirl.create(:user, :manager) }

  before(:each) { sign_in manager }

  it 'GET index' do
    sign_in manager
    get :index
    expect(response).to have_http_status 200
  end

  context 'user sign in' do
    let(:user) { FactoryGirl.create(:user) }

    before(:each) { sign_in user }

    it 'GET index' do
      get :index
      expect(response).to redirect_to root_url
      expect(response).to have_http_status 302
      expect(flash[:info]).to match 'Access denied'
    end
  end

  context 'view response' do
    render_views

    before(:each) { FactoryGirl.create_list(:user, 3) }

    it 'show users' do
      get :index

      manager.team.users.each do |user|
        expect(response.body).to match user.first_name
        expect(response.body).to match user.last_name
        expect(response.body).to match user.email
      end
    end

    it 'show own work time' do
      own_record = manager.records.create(started_at: Time.now, finished_at: Time.now + 8.hours)
      work_time = own_record.finished_at - own_record.started_at
      get :index
      expect(response.body).to match Time.at(work_time).utc.strftime('%H:%M:%S')
    end
  end

end
