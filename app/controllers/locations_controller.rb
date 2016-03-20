class LocationsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :index]
	before_action :set_location, only: [:edit, :update, :destroy]
  def show
  	@posts_by_location = Location.find(params[:id]).posts
  end
  def index
  	@locations = Location.all.order("name ASC")
  end
  
  def new
  	@location = Location.new	
  end
  
  def create
  	@location = Location.new(location_params)

  	respond_to do |format|
  	  if @location.save
  	    format.html { redirect_to locations_path, notice: 'Post was successfully created.' }
  	    format.json { render :show, status: :created, location: locations_path }
  	  else
  	    format.html { render :new }
  	    format.json { render json: locations_path.errors, status: :unprocessable_entity }
  	  end
  	end
  end


  def edit
  	
  end
  def update
  	respond_to do |format|
	  	if @location.update(location_params)
	  		format.html { redirect_to locations_path, notice: 'you have successfully updated!' }
	  		format.json { render :show, status: :ok, location: locations_path }
	  	else
	  		format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
	  	end
	  end
  end

  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_location
  	@location = Location.find(params[:id])
  end
  def location_params
  	params.require(:location).permit(:name)
  end
end
