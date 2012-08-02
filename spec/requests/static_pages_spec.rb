#!/bin/env ruby
# encoding: utf-8

require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the h1 'Коммерческая недвижимость'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Коммерческая недвижимость')
    end

    it "should have the base title" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "Коммерческая недвижимость")
    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Главная')
    end

  end
end
