class UsersController < ApplicationController

  def index
    @users = User.page(params[:page]).per(5).order('created_at DESC')
    @new_book = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @new_book = Book.new
    @books = Book.where(user_id: @user.id)
    @books = @books.page(params[:page]).per(5).order('created_at DESC')
  end

  def edit
    @edit_user = User.find(params[:id])
    if @edit_user == current_user
    else
      redirect_to users_path
    end
  end
  
  def update
    edit_user = User.find(params[:id])
    if edit_user.update(user_params)
      flash[:success] = "Changed profile successfully!"
      redirect_to user_path(edit_user.id)
    else
      flash[:warning] = "Changed profile error."
      redirect_to edit_user_path(edit_user.id)
    end
  end  
  
    private

    def user_params
      params.require(:user).permit(:name, :profile_image, :intro)
    end

end