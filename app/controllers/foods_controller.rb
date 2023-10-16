class FoodsController < ApplicationController
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
      redirect_to user_foods_path(@user)
    else
      render :new
    end
  end

  def destroy
    @user = current_user
    @food = Food.find(params[:id])
    if @food.destroy
      flash[:notice] = 'Food deleted successfully'
      redirect_to user_foods_path(@user)
    else
      flash[:alert] = 'Food was not deleted'
    end
  end

  private

  def foods_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
