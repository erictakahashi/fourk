class EstablishmentsController < ApplicationController
  def index
    @establishments = Establishment.all
  end
end
