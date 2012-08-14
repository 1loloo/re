#!/bin/env ruby
# encoding: utf-8

require 'spec_helper'

describe "When on new ad page" do

  subject { page }

	describe "Подать объявление" do
		before { visit new_ad_path } 

    it { should have_selector('title', text: full_title('Подать объявление')) }
    it { should have_selector 'title', text: '| Подать объявление' }
  end


  describe "and fill in and send" do

    let(:ad) { FactoryGirl.create(:ad) }

		before do
    	visit new_ad_path
			fill_in "Заголовок",    with: ad.title
			fill_in "Описание",    with: ad.description
			click_button "Отправить"
		end

#		it "should render ad's page" do
#			page.should have_selector('title', text: ad.title)
#		end
	end

end
