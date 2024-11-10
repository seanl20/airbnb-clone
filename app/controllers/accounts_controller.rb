# frozen_string_literal: true

class AccountsController < ApplicationController
  def show
    @user = Users::Queries::Find.new.call(id: params[:id])
  end

  def update
    @user = Users::Commands::Update.new.call(id: params[:id], params: account_params)

    if @user
      redirect_to account_path(@user)
    else
      redirect_to root_path
    end
  end

  private

  def account_params
    params.require(:account).permit(:email)
  end
end