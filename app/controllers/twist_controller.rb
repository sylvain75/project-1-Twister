class TwistController < ApplicationController
  def index
   @twists = Twist.all.reverse
  end

  def new
   @twist = Twist.new
  end

  def show
    @twist = Twist.find params[:id]
  end

  def create
   @twist = Twist.create twist_params
   @current_user.twists << @twist if @current_user.present?
   redirect_to twists_path
  end

  def update
    @twist = Twist.find params[:id]
    @twist.update twist_params
    redirect_to twists_path
  end

  def edit
    @twist = Twist.find params[:id]
  end

  private
  def twist_params
    params.require(:twist).permit(:content)
  end
end
