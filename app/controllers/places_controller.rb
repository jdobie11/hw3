class PlacesController < ApplicationController


  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
    @entries = @place.entries # Fetch all entries for this place
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to places_path, notice: 'Place was successfully created.'
    else
      render :new
    end
  end



  def place_params
    params.require(:place).permit(:name) 
  end
end
