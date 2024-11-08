# frozen_string_literal: true

class ProfilesController < ApplicationController
  def show
    @profile = Profiles::Queries::Find.new.call(id: params[:id])
  end
end