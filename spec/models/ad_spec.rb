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
#

#!/bin/env ruby
# encoding: utf-8

require 'spec_helper'

describe User do

  subject { ad }

  let(:ad) { FactoryGirl.create(:ad) }

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

  it { should be_valid }





end
