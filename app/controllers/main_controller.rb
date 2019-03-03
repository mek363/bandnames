class MainController < ApplicationController
  def home
    @bandnames = Bandname.paginate(page: params[:page])
  end
end
