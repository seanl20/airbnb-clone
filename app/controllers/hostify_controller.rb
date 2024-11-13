# frozen_string_literal: true

class HostifyController < ApplicationController
  before_action :authenticate_user!

  def update
    Hostify::Commands::UserHost.new.call(user_id: params[:user_id])

    redirect_back(fallback_location: root_path)
  end
end
