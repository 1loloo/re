#!/bin/env ruby
# encoding: utf-8
require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('title', text: user.name) }
  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit edit_user_path(user) }

    describe "with invalid information" do
      before { click_button "Сохранить" }

      it { should have_content('error') }
    end
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Сохранить" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Имя",         with: "Example"
        fill_in "Телефон",         with: "1234567"
        fill_in "Email",        with: "user@example.com"
        fill_in "Пароль",     with: "foobar"
        fill_in "Подтверждение пароля", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving a user" do
        before { click_button submit }

        let(:user) { User.find_by_email("user@example.com") }

        it { should have_selector('title', text: user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        it { should have_link('Выход') }
      end
    end
  end

end








