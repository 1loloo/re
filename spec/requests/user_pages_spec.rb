#!/bin/env ruby
# encoding: utf-8

require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "Регистрация" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Регистрация') }
    it { should have_selector('title', text: full_title('Регистрация')) }
  end
end
