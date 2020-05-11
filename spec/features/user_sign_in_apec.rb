require 'rails_helper'

feature 'User sign in', '
  In order to be able to create post
  As an user
  I want to be able to sign in
' do

  given(:user) { create(:user) }
  given(:user_with_name) { create(:user_with_name) }

  scenario 'Registered user try to sign in without first and last names' do
    sign_in(user)

    expect(text).to have_content "Вам потрібно вказати Ваше ім'я та прізвище"
    expect(current_path).to eq "/uk/users/edit"
  end

  scenario 'Registered user try to sign in with first and last names' do
    sign_in(user_with_name)

    expect(text).to have_content "Вхід успішний"
    expect(current_path).to eq "/uk"
  end

  scenario 'Non-registered user try to sign in' do
    visit new_user_session_path
    fill_in 'Email', with: 'wrong@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content 'Невірний Email або пароль.'
    expect(current_path).to eq "/uk/users/sign_in"
  end
end