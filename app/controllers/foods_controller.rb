class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @foods = @user.foods.all
  end

  def show; end

  def new
    @food = Food.new
  end

  def create
    @user = current_user
    @food = @user.foods.build(foods_params)
    if @food.save
      redirect_to foods_path
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_url, notice: 'Food item was successfully deleted.'
  end

  private

  def foods_params
    params.require(:food).permit(:name, :measurement_unit, :quantity, :price)
  end
end
