class AdminRegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    admin_code = params[:user][:admin_code]

    if admin_code == "ADMIN2025!"  #  secret admin code
      @user = User.new(user_params.merge(admin: true))

      if @user.save
        redirect_to new_user_session_path, notice: "Admin account created!"
      else
        render :new, status: :unprocessable_entity
      end
    else
      flash[:alert] = "Invalid admin code"
      redirect_to admin_register_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
