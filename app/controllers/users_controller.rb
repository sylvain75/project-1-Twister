class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin, :only => [:index]
  before_action :check_if_logged_in, :only => [:edit, :update]


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = @current_user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Follows a user.
  def follow
    followed_user = User.find params[:id]
    unless @current_user.following.include? followed_user
      @current_user.active_relationships.create(followed_id: params[:id])
    end
    redirect_to followed_user
  end

  # Unfollows a user.
  def unfollow
    followed_user = User.find params[:id]
    @current_user.active_relationships.find_by(followed_id: params[:id]).destroy
    redirect_to followed_user
  end

  # Shows the users a user is following
  def following
    @user = User.find params[:id]
  end

  # Shows the users who follow a user
  def followers
    @user = User.find params[:id]
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def check_if_admin
    redirect_to root_path unless @current_user.present? && @current_user.admin?
    end

    def check_if_logged_in
    redirect_to root_path unless @current_user.present?
    end 
end
