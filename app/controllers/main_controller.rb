class MainController < ApplicationController
  require 'will_paginate/array' 
  
  def home
    @bandnames = Bandname.order(:cached_weighted_average => :desc).paginate(page: params[:page])
  end
end
