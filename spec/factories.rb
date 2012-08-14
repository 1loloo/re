#!/bin/env ruby
# encoding: utf-8

FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
		phone		 "1234567890"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :ad do
		title "Michael Hartl"
		description "Michael Hartl"
		owner 1
		deal 1
		real_estate 1
		purpose 1
		area 2.3
		price 3.4
		rooms_number 3
		floor 0
		water true
		light true
		bathroom true
		heating false
		image "12dd.jpeg"
		region 1
		city 12
		user 
  end
end
