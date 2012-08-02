#!/bin/env ruby
# encoding: utf-8

require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Коммерческая недвижимость'" do
      visit '/static_pages/home'
      page.should have_content('Коммерческая недвижимость')
    end

    it "should have the title 'Главная'" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "Коммерческая недвижимость | Главная")
    end

  end
end
