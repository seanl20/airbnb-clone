# frozen_string_literal: true

class ProfilesController < ApplicationController
  def show
    @profile = Profiles::Queries::Find.new.call(id: params[:id])
    authorize @profile
  end

  def update
    profile = Profiles::Queries::Find.new.call(id: params[:id])
    authorize profile

    @profile = Profiles::Commands::Update.new.call(id: params[:id], params: profile_params)

    if @profile
      redirect_to profile_path(@profile)
    else
      redirect_to root_path
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :first_name,
      :last_name,
      :address_1,
      :address_2,
      :city,
      :state,
      :zip_code,
      :country_code,
      :picture
    )
  end
end