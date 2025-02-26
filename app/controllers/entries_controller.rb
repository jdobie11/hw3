class EntriesController < ApplicationController
  def show
    @entry = Entry.find(params[:id])
    @place = Place.find_by({"id" => @entry["place_id"]})
    # render contacts/show view with details about Contact
  end

  def new
    @place = Place.find(params[:place_id])
    @entry = Entry.new
  end

  def create
    @place = Place.find(params[:place_id])
    @entry = @place.entries.build(entry_params)

    if @entry.save
      redirect_to place_path(@place), notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :description, :date)
  end
end
