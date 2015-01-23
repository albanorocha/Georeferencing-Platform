class Maps::OutdoorsController < Maps::MapsController
  before_action :authenticate_user!
  
  before_action :set_outdoor, only: [:show, :edit, :update, :destroy]
  before_action :set_markers, only: [:index, :new]

  respond_to :html

  def index
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
    @outdoor = Dashboard::Outdoor.new

    respond_with(@outdoor)
  end

  def edit
    @outdoors = Dashboard::Outdoor.where.not(id: @outdoor)
    @hash = Gmaps4rails.build_markers(@outdoors) do |outdoor, marker|
      marker.lat outdoor.latitude
      marker.lng outdoor.longitude
      marker.title   outdoor.code
      marker.picture({ 
        url:    "/assets/marcador32.png",
        width:  32,
        height: 32
      })
    end
  end

  def create
    @outdoor = Dashboard::Outdoor.new(outdoor_params)
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
      @outdoor = Dashboard::Outdoor.find(params[:id])
    end

    def set_markers
      @outdoors = Dashboard::Outdoor.all
      @hash = Gmaps4rails.build_markers(@outdoors) do |outdoor, marker|
        marker.lat outdoor.latitude
        marker.lng outdoor.longitude
        marker.title   outdoor.code
        marker.picture({ 
          url:    "/assets/marcador32.png",
          width:  32,
          height: 32
        })
      end
    end

    def outdoor_params
      params.require(:dashboard_outdoor).permit(:name, :code, :description, :address, :latitude, :longitude)
    end
end
