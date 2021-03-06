class ApplicationController < ActionController::Base
  protect_from_forgery

  # TODO: Eliminar luego de verificar su funcionamiento en producción
  def test_exception_notification
    raise 'Testing exception raising'
  end


  protected

  # picks up the filter from params[:bloques]
  # loads bloques to be used in filtering
  def setup_filters
    @filter = {}
    @filter[:bloques] = params[:bloques]
    @filter[:distritos] = params[:distritos]
    @bloques = load_political_parties
  end

  # sorts and paginates by default the legislators
  def sort_and_paginate_legislators(legislators)
    legislators.all(:include => [:politician], :order => 'Politician.lastName ASC').paginate :page => params[:page], :per_page => PER_PAGE
  end

  def load_districts
    @distritos = District.all
  end

end

