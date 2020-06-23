class Web::PasswordResetsController < ApplicationController
  def new
    @password_reset = PasswordResetForm.new
  end

  def create
    @password_reset = PasswordResetForm.new(password_reset_params)
    email = @password_reset.email
    @user = User.find_by(email: email)

    if @password_reset.valid?
      @user.generate_token
      redirect_to(password_resets_path)
      # UserMailer.with({ user: @user }).password_reset.deliver_now
      SendPasswordResetNotificationJob.perform_async(@user.email)
    else
      redirect_to(new_password_reset_path)
    end
  end

  def edit
    @user = find_user_by_token
  end

  def update
    @user = find_user_by_token
    if !@user.has_active_token?
      redirect_to(new_password_reset_path)
    elsif @user.update(user_params)
      @user.delete_password_reset_token
      redirect_to(new_session_path)
    else
      render(:edit)
    end
  end

  private

  def password_reset_params
    params.require(:password_reset_form).permit(:email)
  end

  def user_params
    params.require(@user.type.downcase).permit(:password, :password_confirmation)
  end

  def find_user_by_token
    User.find_by(password_reset_token: params[:id])
  end
end
