require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'authentication' do
    let(:user) { FactoryGirl.create(:user) }

    it 'should authenticate user' do
      expect(User.authenticate(user.email, user.password)).to_not be_nil
    end

    it 'should not authenticate user' do
      expect(User.authenticate('fake_email', 'fake_password')).to be_nil
    end

    it 'should not authenticate user if missed email' do
      expect(User.authenticate('', user.password)).to be_nil
    end

    it 'should not authenticate user if missed password' do
      expect(User.authenticate(user.email, '')).to be_nil
    end
  end
end
