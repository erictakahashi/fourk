class EstablishmentsController < ApplicationController
  def index
    @establishments = Establishment.all
  end

  def new
    #@establishment = Establishment.new
  end
end
