#!/bin/env ruby
# encoding: utf-8
require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "index" do

		describe "admin" do

		  let(:admin) { FactoryGirl.create(:admin) }

		  before(:each) do
		    sign_in admin
		    visit users_path
		  end

		  it { should have_selector('title', text: 'All users') }
		  it { should have_selector('h1',    text: 'All users') }

		  describe "pagination" do

		    before(:all) { 30.times { FactoryGirl.create(:user) } }
		    after(:all)  { User.delete_all }

		    it { should have_selector('div.pagination') }

		    it "should list each user" do
		      User.paginate(page: 1).each do |user|
		        page.should have_selector('li', text: user.name)
		      end
		    end
		  end

		  describe "delete links" do

		    it { should_not have_link('delete') }

		    describe "as an admin user" do

				  before(:all) { 1.times { FactoryGirl.create(:user) } }
				  after(:all)  { User.delete_all }

		      it { should have_link('delete', href: user_path(User.first)) }
		      it "should be able to delete another user" do
		        expect { click_link('delete') }.to change(User, :count).by(-1)
		      end
		      it { should_not have_link('delete', href: user_path(admin)) }
		    end
		  end
		end

		describe "user" do
		  let(:user) { FactoryGirl.create(:user) }

		  before(:each) do
		    sign_in user
		    get users_path 
		  end

     	specify { response.should redirect_to(root_path) }
		end
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('title', text: user.name) }
  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

#    describe "with invalid information" do
#      before { click_button "Сохранить" }

#      it { should have_content('error') }
#    end

    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      let(:new_phone) { "999111222333" }
      before do
        fill_in "Имя",             with: new_name
        fill_in "Телефон",          with: new_phone
        fill_in "Email",            with: new_email
        fill_in "Пароль",         with: user.password
        fill_in "Подтверждение пароля", with: user.password
        click_button "Сохранить"
      end

      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Выход', href: signout_path) }
      specify { user.reload.name.should  == new_name }
      specify { user.reload.email.should == new_email }
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








