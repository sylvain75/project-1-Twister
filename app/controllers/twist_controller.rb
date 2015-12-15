class TwistController < ApplicationController
  def index
   @twists = Twist.all
  end

  def new
   @twist = Twist.new
  end

  def create
   @twist = Twist.create :content => params[:content], :user_id => @current_user.id if @current_user
   redirect_to twists_path
  end

  def update  
   @twist.update params[:twists]
  end
end
