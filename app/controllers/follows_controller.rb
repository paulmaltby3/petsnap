class FollowsController < ApplicationController
  def create
      @user = User.find_by(username: params[:username])
      Follow.create(followable: @user, follower: current_user)
      redirect_to user_path(@user.username), notice: "Successfully followed user"
  end
  
  def destroy
      @user = User.find_by(username: params[:username])
      Follow.find_by(followable: @user, follower: current_user).destroy
      redirect_to user_path(@user.username), notice: "Successfully unfollowed user"
  end
  
  #Not sure if this works below!
  
  #copied from tweets controller
   # GET /tweets
  #def index
    #@user = Follow.all
  #end
  
  
    # GET /tweets/1
  #def show
    #@tweet = Tweet.find(params[:id])
  #end
  
  #copied from 'create' above in same file
    #def show
      #@user = User.find_by(username: params[:username])
      #Follow.find_by(followable: @user, follower: current_user).show
      # redirect_to user_path(@user.username), notice: "Successfully unfollowed user" 
    #end
    
    #From routes guidance on rials
    #def show
        #@product = Product.find(params[:id])
    #end
  
end