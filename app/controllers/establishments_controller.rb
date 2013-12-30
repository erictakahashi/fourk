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
      redirect_to @establishment
    else
      render "new"
    end
  end

  def show
    @establishment = Establishment.find(params[:id])
  end

  def edit
    @establishment = Establishment.find(params[:id])
  end

  def update
    @establishment = Establishment.find(params[:id])

    if @establishment.update_attributes!(params_establishment(params))
      redirect_to @establishment
    else
      render "edit"
    end
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
