#!/bin/env ruby
# encoding: utf-8
require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_selector('div.alert.alert-error', text: 'Неверный') }
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
      end
      it { should have_selector('title', text: user.name) }
      it { should have_link('Профиль', href: user_path(user)) }
      it { should have_link('Выход', href: signout_path) }
      it { should_not have_link('Вход', href: signin_path) }

      describe "followed by signout" do
        before { click_link "Выход" }
        it { should have_link('Вход') }
      end
    end

  end
end
















