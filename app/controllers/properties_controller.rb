class PropertiesController < ApplicationController
  def show
    @property = Properties::Queries::Find.new.call(id: params[:id])
  end
end
