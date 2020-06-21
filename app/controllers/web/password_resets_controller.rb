class Web::PasswordResetsController < ApplicationController
  def new
    @password_reset = PasswordResetForm.new
  end

  def create
    @password_reset = PasswordResetForm.new(password_reset_params)
    @user = @password_reset.user
    byebug
    if @password_reset.valid?
      @user.generate_token
      render(:index)
      UserMailer.with({ user: @user }).password_reset.deliver_now
    else
      render(:new)
    end
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    byebug
    if @user.password_reset_sent_at < 24.hour.ago
      redirect_to(new_password_reset_path)
    elsif @user.update(user_params)
      @user.change_time_reset_token(@user)
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
    params.require(@user).permit(:password, :password_confirmation)
    # params.require(:developer).permit(:password, :password_confirm)
  end
end
