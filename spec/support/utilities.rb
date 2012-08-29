#!/bin/env ruby
# encoding: utf-8
include ApplicationHelper

def sign_in(user)
  visit signin_path
  fill_in "Email",    with: user.email
  fill_in "Пароль", with: user.password
  click_button "Войти"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end
