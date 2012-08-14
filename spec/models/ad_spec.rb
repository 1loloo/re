# == Schema Information
#
# Table name: ads
#
#  id           :integer         not null, primary key
#  title        :string(255)
#  description  :text
#  owner        :integer(1)
#  deal         :integer(1)
#  real_estate  :integer(1)
#  purpose      :integer(1)
#  area         :float
#  floor        :integer(1)
#  rooms_number :integer(1)
#  water        :boolean
#  light        :boolean
#  bathroom     :boolean
#  heating      :boolean
#  image        :string(255)
#  region       :integer(1)
#  city         :integer(1)
#  user_id      :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  price        :decimal(8, 2)
#

#!/bin/env ruby
# encoding: utf-8

require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.create(:user) }
	5.times { let(:ad) { FactoryGirl.create(:ad, user: user) } } 

  subject { ad }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:owner) }
  it { should respond_to(:deal) }
  it { should respond_to(:real_estate) }
  it { should respond_to(:purpose) }
  it { should respond_to(:area) }
  it { should respond_to(:floor) }
  it { should respond_to(:water) }
  it { should respond_to(:light) }
  it { should respond_to(:bathroom) }
  it { should respond_to(:image) }
  it { should respond_to(:region) }
  it { should respond_to(:city) }
  it { should respond_to(:user_id) }
  it { should respond_to(:rooms_number) }
  it { should respond_to(:heating) }
  it { should respond_to(:price) }
	it { should respond_to(:user) }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Ad.new(user_id: "1")
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when user_id is not present" do
    before { ad.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank title" do
    before { ad.title = " " }
    it { should_not be_valid }
  end

  describe "with blank description" do
    before { ad.description = " " }
    it { should_not be_valid }
  end

  describe "with blank area" do
    before { ad.area = " " }
    it { should_not be_valid }
  end

  describe "with blank price" do
    before { ad.price = " " }
    it { should_not be_valid }
  end

  describe "with blank real_estate" do
    before { ad.real_estate = 0 }
    it { should_not be_valid }
  end

  describe "with blank purpose" do
    before { ad.purpose = 0 }
    it { should_not be_valid }
  end

end


















