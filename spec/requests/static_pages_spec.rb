#!/bin/env ruby
# encoding: utf-8

require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
		before { visit root_path } 

    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector 'title', text: '| Главная' }
  end

end















