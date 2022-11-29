
class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show update destroy]
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  # GET /properties
  def index
    @properties = Property.all

    render json: PropertySerializer.new(@properties).serializable_hash[:data]
  end

  # GET /properties/1
  def show
    render json: @property
  end

  # POST /properties
  def create
    @property = Property.new(property_params)
    @property.user = current_user
    if @property.save
      render json: @property, status: :created, location: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /properties/1
  def update
    if @property.update(property_params) && @property.user == current_user
      render json: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # DELETE /properties/1
  def destroy
    return unless @property.user == current_user

    @property.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def property_params
    params.require(:property).permit(:title, :price, :description, :user_id, :picture, :address, :city, :zipcode, :aera, :rooms, :furnished, :car_park, :has_outside, :basement)
  end
end