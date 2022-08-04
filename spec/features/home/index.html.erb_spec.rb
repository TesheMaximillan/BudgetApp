require 'rails_helper'

RSpec.describe 'home/index', type: :feature do
  describe 'displays the home page' do
    it 'displays the name of the app' do
      visit(root_path)
      expect(page).to have_content('Budget App')
    end

    it 'Login button is present' do
      visit(root_path)
      expect(page).to have_content('LOG IN')
    end

    it 'Login button Link to login page' do
      visit(root_path)
      expect(page).to have_link('LOG IN', href: new_user_session_path)
    end

    it 'Signup button is present' do
      visit(root_path)
      expect(page).to have_content('SIGN UP')
    end

    it 'Signup button Link to signup page' do
      visit(root_path)
      expect(page).to have_link('SIGN UP', href: new_user_registration_path)
    end
  end

  describe 'displays the SIGN IN and SIGN UP page' do
    it 'displays the header title LOGUN' do
      visit(new_user_session_path)
      expect(page).to have_content('LOGIN')
    end

    it 'displays the header title SIGNUP' do
      visit(new_user_registration_path)
      expect(page).to have_content('SIGNUP')
    end
  end
end
