class EstablishmentsController < ApplicationController
  def index
    @establishments = Establishment.all

    @foods = Food.all
  end

  def new
    @establishment = Establishment.new

    @establishments = Establishment.all
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

    @food = Food.new
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

  # Methods to add and remove foods from establishments
  def foods
    @establishment = Establishment.find(params[:id])
    @foods = @establishment.foods
  end

  def food_add
    @establishment = Establishment.find(params[:id])
    @food = Food.find(params[:food])

    if not @establishment.enrolled_in?(@food)
      @establishment.foods << @food
      flash[:notice] = 'Comida associada ao restaurante'
    else
      flash[:notice] = 'Comida já associada ao restaurante'
    end
    redirect_to @establishment
  end

  def food_remove
    @establishment = Establishment.find(params[:id])
    food_ids = params[:foods]

    unless food_ids.blank?
      food_ids.each do |food_id|
        food = Food.find(food_id)
        if @establishment.enrolled_in?(food)
          logger.info "Removendo a comida do restaurante"
          @establishment.foods.delete(food)
          flash[:notice] = 'Comida removida do restaurante'
        end
      end
    end
    redirect_to @establishment
  end


  def categories
    @establishment = Establishment.find(params[:id])
    @categories = @establishment.categories
  end

  def category_add
    @establishment = Establishment.find(params[:id])
    @category = Category.find(params[:category])

    if not @establishment.enrolled_in_category?(@category)
      @establishment.categories << @category
      flash[:notice] = 'Categoria associada ao restaurante'
    else
      flash[:notice] = 'Categoria já associada ao restaurante'
    end
    redirect_to @establishment
  end

  def category_remove
    @establishment = Establishment.find(params[:id])
    category_ids = params[:categories]

    unless category_ids.blank?
      category_ids.each do |category_id|
        category = Category.find(category_id)
        if @establishment.enrolled_in_category?(category)
          logger.info "Removendo a categoria do restaurante"
          @establishment.categories.delete(category)
          flash[:notice] = 'Categoria removida do restaurante'
        end
      end
    end
    redirect_to @establishment
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
