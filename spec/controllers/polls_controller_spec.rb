require 'rails_helper'

RSpec.describe PollsController, :type => :controller do

  describe 'create' do
    let(:user) { FactoryGirl.create(:user) }

    context 'valid attrs' do
      it 'should create new poll' do
        session[:user_id] = user.id
        post :create, poll: { user_id: user.id, title: 'new poll', options_attributes: { '0' => 'option 1', '1' => 'option 2' } }
        poll = user.polls.find_by_title('new poll')
        expect(poll).to_not be_nil
      end
    end

    context 'invalid attrs' do
      it 'should create new poll' do
        session[:user_id] = user.id
        post :create, poll: { user_id: user.id, title: '', options_attributes: { '0' => '', '1' => '' } }
        poll = user.polls.find_by_title('new poll')
        expect(poll).to be_nil
      end
    end
  end

  describe 'update' do
    let(:user) { FactoryGirl.create(:user) }
    let(:poll) { FactoryGirl.create(:poll, title: 'test poll', user_id: user.id) }

    context 'valid attrs' do
      it 'should create new poll' do
        session[:user_id] = user.id
        put :update, id: poll.id, poll: {
                       id: poll.id, user_id: user.id, title: 'new poll after update', options_attributes: { '0' => 'option 1', '1' => 'option 2' }
                   }
        poll.reload

        expect(poll.title).to eql('new poll after update')
      end
    end

    context 'invalid attrs' do
      it 'should create new poll' do
        session[:user_id] = user.id
        put :update, id: poll.id, poll: {
                       id: poll.id, user_id: user.id, title: '', options_attributes: { '0' => '', '1' => '' }
                   }
        poll.reload

        expect(poll.title).to eql('test poll')
      end
    end
  end
end
