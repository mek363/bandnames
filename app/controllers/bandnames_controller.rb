class BandnamesController < ApplicationController

  def show
    @bandname = Bandname.find(params[:id])
  end

  def new
    @bandname = Bandname.new
  end

  def create
    @bandname = current_user.bandnames.build(bandname_params)
    if @bandname.save
      flash[:success] = "New band name logged"
      redirect_to @bandname
    else
      render 'new'
    end
  end

  private

    def bandname_params
      params.require(:bandname).permit(:name)
    end
end
