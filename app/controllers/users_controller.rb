class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy] #this is loading controller and setting the variable (in private method) for each action
  
  
  def index
    @users = User.all
  end

  def show
    @user #could delete this so code is DRY
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end


  def edit
    @user #could delete
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
      redirect_to users_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params

      params.require(:user).permit(:first_name, :last_name, :age, :hair_color, :eye_color, :gender, :alive)
    end
end
