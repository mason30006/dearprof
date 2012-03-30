class UsersController < ApplicationController
  before_filter CASClient::Frameworks::Rails::Filter
  before_filter :signed_in_user, only: [:home]
  before_filter :not_signed_in, only: [:new]

  def new
  	@netid = session[:cas_user]
    ldap_con = initialize_ldap_con()

  	@user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Great! You're ready to get started!"
      redirect_to home_path
    else
      @netid = session[:cas_user]
      flash[:error] = "Sorry, that information is invalid. Please make sure to include a first and last name."
      render :new
    end
  end

  def home
  end

  private
  	def signed_in_user
      unless signed_in?
        redirect_to new_user_path, notice: "Please create an account."
      end
    end

    def not_signed_in
      if signed_in?
        flash[:error] = "You already have an account!"
        redirect_to home_path
      end
    end
end