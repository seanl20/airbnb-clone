# frozen_string_literal: true

class PasswordsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = Users::Queries::Find.new.call(id: params[:id])
    authorize @user, policy_class: PasswordPolicy
  end

  def update
    user = Users::Queries::Find.new.call(id: params[:id])
    authorize user, policy_class: PasswordPolicy

    @user = Users::Commands::UpdatePassword.new.call(id: params[:id], password: password_params[:password])
    
    if @user
      bypass_sign_in(@user)
      redirect_to password_path(@user)
    else
      redirect_to root_path
    end
  end

  private

  def password_params
    params.require(:password).permit(:password)
  end
end