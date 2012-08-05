#!/bin/env ruby
# encoding: utf-8

class AdsController < ApplicationController

	def index
	end

  def show
    @ad = Ad.find(params[:id])
  end

  def new
		@ad = Ad.new
#		if current_user
#			current_user.ad = Ad.new
#		else 
#			@user = User.new
#			@user.ad = Ad.new
#		end
  end

  def create
    @ad = Ad.new(params[:post])
    if @ad.save
      flash[:success] = "Объявление успешно создано!"
      redirect_to @ad
    else
      render 'new'
    end
  end

end





