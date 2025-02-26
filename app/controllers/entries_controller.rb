class EntriesController < ApplicationController

  def create

    @entry = Entry.new

    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["date"] = params["date"]


    @entry["place_id"] = params["place_id"]

    if @entry.save
      redirect_to "/places/#{@entry["place_id"]}"
    else

      @place = Place.find_by({ "id" => params["place_id"] }) 
      render :new  
    end
  end

  def new
    @place = Place.find_by({ "id" => params["place_id"] })
  end

end
