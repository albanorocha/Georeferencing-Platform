class OutdoorsController < ApplicationController
  before_action :authenticate_user!
  
  before_action :set_outdoor, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @outdoors = Outdoor.all
    respond_with(@outdoors)
  end

  def show
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
