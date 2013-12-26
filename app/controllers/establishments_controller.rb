class EstablishmentsController < ApplicationController
  def index
    @establishments = Establishment.all
  end

  def new
    @establishment = Establishment.new
  end

  def create
    @establishment = Establishment.new(params_establishment(params))

    if @establishment.save
      redirect_to "index"
    else
      render "new"
    end
  end

  def show
    @establishment = Establishment.find(params[:id])
  end

  private
  def params_establishment(params)
    params.require(:establishment).permit(:name, 
                                          :description, 
                                          :address, 
                                          :zipcode,
                                          :city,
                                          :state)
  end
end
