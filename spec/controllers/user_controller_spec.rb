require 'rails_helper'

describe UsersController do
  describe 'registration' do
    context 'valid params' do
      it 'should register' do
        user_attrs = {
            first_name: 'John',
            last_name: 'Smith',
            email: 'johns@example.com',
            password: '111111',
            password_confirmation: '111111'
        }
        get :create, user: user_attrs

        user = User.where(first_name: 'John', last_name: 'Smith', email: 'johns@example.com').first
        expect(user).to_not be_nil
      end
    end

    context 'invalid params' do
      it 'should not register' do
        user_attrs = {
            first_name: 'John',
            last_name: '',
            email: 'johns@example.com',
            password: '111111',
            password_confirmation: ''
        }
        get :create, user: user_attrs

        user = User.where(first_name: 'John', email: 'johns@example.com').first
        expect(user).to be_nil
      end
    end
  end
end