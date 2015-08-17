class HousesController < ApplicationController
  def new
    @houses = House.new
  end

  def create
    @houses = House.new(house_params)

    if @houses.save
      flash[:info] = "House successfully created!"
      redirect_to root_path
    else
      flash[:error] = "Oh no! Something went wrong."
      render 'new'
    end

  end

  def show
  end

  def index
    @houses = House.all
  end

  def edit
    @house = House.find(params[:id])
  end

  def update
    @house = House.find(params[:id])
    if @house.update(house_params)
      flash[:success] = "House successfully updated!"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    House.delete(params[:id])
      flash[:info] = "House successfully deleted."
      redirect_to :back
  end

  private

  def house_params
      params.require(:house).permit(:address, :purchase_price)
  end
end
