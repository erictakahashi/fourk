class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  # GET /foods
  # GET /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new

    @foods = Food.all
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.js
        format.html { redirect_to @food, notice: 'Food was successfully created.' }
        format.json { render action: 'show', status: :created, location: @food }
      else
        format.html { render action: 'new' }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to @food, notice: 'Food was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url }
      format.json { head :no_content }
    end
  end


  def categories
    @food = Food.find(params[:id])
    @categories = @food.categories
  end

  def category_add
    @food = Food.find(params[:id])
    @category = Category.find(params[:category])

    if not @food.enrolled_in_category?(@category)
      @food.categories << @category
      flash[:notice] = 'Categoria associada'
    else
      flash[:notice] = 'Categoria já associada'
    end
    redirect_to @food
  end

  def category_remove
    @food = Food.find(params[:id])
    category_ids = params[:categories]

    unless category_ids.blank?
      category_ids.each do |category_id|
        category = Category.find(category_id)
        if @food.enrolled_in_category?(category)
          logger.info "Removendo a categoria"
          @food.categories.delete(category)
          flash[:notice] = 'Categoria removida'
        end
      end
    end
    redirect_to @food
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:name, :description)
    end
end
