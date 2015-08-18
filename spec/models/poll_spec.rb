require 'rails_helper'

RSpec.describe Poll, :type => :model do
  describe 'search' do
    let(:poll) { FactoryGirl.create(:poll, title: 'test poll') }

    it 'should find polls by query' do
      polls = Poll.search('est')
      expect(polls).to match_array([poll])
    end

    it 'should not find polls by query' do
      polls = Poll.search('aaa')
      expect(polls).to_not match_array([poll])
    end
  end
end
