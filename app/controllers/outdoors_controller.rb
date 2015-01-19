class OutdoorsController < ApplicationController
  before_action :authenticate_user!
  
  before_action :set_outdoor, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @outdoors = Outdoor.all
    @hash = Gmaps4rails.build_markers(@outdoors) do |outdoor, marker|
      marker.lat outdoor.latitude
      marker.lng outdoor.longitude
      marker.title   outdoor.code
    end
    respond_with(@outdoors)
  end

  def show
    @hash = Gmaps4rails.build_markers(@outdoor) do |outdoor, marker|
      marker.lat outdoor.latitude
      marker.lng outdoor.longitude
    end
    respond_with(@outdoor)
  end

  def new
    @outdoor = Outdoor.new
    respond_with(@outdoor)
  end

  def edit
  end

  def create
    @outdoor = Outdoor.new(outdoor_params)
    @outdoor.save
    respond_with(@outdoor)
  end

  def update
    @outdoor.update(outdoor_params)
    respond_with(@outdoor)
  end

  def destroy
    @outdoor.destroy
    respond_with(@outdoor)
  end

  private
    def set_outdoor
      @outdoor = Outdoor.find(params[:id])
    end

    def outdoor_params
      params.require(:outdoor).permit(:name, :code, :description, :address, :latitude, :longitude)
    end
end
