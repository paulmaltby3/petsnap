class UsersController < ApplicationController
  def show
     @user = User.find_by(username: params[:username])
     @tweets = @user.tweets
  end
end





#class UsersController < ApplicationController
#  before_action :authenticate_user!, except: [:create, :destroy]
  
#  def show
#     @user = User.find_by(username: params[:username])
     #@tweets = @user.tweets
#  end
#end







  # from https://rails-4-0.railstutorial.org/book/updating_and_deleting_users
  #def edit
    #@user = User.find_by(username: params[:])
  #end

  #def update
    #@user = User.find(params[:id])
    #if @user.update(user_params)
      #redirect_to adminpanel_path
    #else
      #render 'edit'
    #end
  #end

  #I put this in myself to try and enable the edit_user_registrations path which was returning a nil for @user.username line 3 of show.html.erb when attempting the edit link
  #protected
  
  #def edit  
    #@user = current.user
    #@user = User.find_by(username: params[:username])
    #redirect_to edit_user_registration_path(@user.username)
  #end

