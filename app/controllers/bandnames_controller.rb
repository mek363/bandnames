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

  def vote 
    @bandname = Bandname.find(params[:id])
    @bandname.upvote_by current_user, {vote_weight: params[:rank]}
    redirect_to @bandname
  end  
  
  private

    def bandname_params
      params.require(:bandname).permit(:name)
    end
end
