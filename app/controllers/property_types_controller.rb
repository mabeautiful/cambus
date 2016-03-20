class PropertyTypesController < ApplicationController
	before_action :find_property, only: [:edit, :update, :destroy]
  def index
  	@properties = PropertyType.all.order("property_name ASC")
  end

  def show
  	@posts_by_property = PropertyType.find(params[:id]).posts
  end

  def new
  	@property =PropertyType.new
  end

  def create
  	@property = PropertyType.new(property_params)
  	if @property.save!
  		redirect_to property_types_path
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @property.update(property_params)
  		redirect_to property_types_path, notice: "You have successfully updated property."
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@property.destroy
  	redirect_to property_types_path
  end

  private

  def find_property
  	@property = PropertyType.find(params[:id])
  end

  def property_params
  	params.require(:property_type).permit(:property_name)
  end
end
