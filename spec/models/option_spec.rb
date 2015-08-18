require 'rails_helper'

RSpec.describe Option, :type => :model do
  describe 'voting' do

    let(:poll) { FactoryGirl.create(:poll, title: 'test poll') }
    let(:option) { FactoryGirl.create(:option, title: 'test poll', poll_id: poll.id) }

    it 'should add vote' do
      option.voting
      expect(option.votes).to eql(1)
    end
  end
end
