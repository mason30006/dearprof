class StaticPagesController < ApplicationController
  def home
  	if signed_in?
  		redirect_to home_path
  	end
  end

  def about
  end
end
