class VotelotController < ApplicationController
  def new
    @lot = Bandname.order(:cached_votes_total).limit(5)
  end

end
