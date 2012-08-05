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

class Ad < ActiveRecord::Base
  belongs_to :user
  attr_accessible :area, :bathroom, :city, :deal, :description, :floor, :image, :light, :owner, 
									:purpose, :region, :title, :real_estate, :water, :rooms_number, :heating







end
