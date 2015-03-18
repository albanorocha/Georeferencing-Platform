class Maps::OutdoorsController < Maps::MapsController
  before_action :authenticate_user!
  
  before_action :set_outdoor, only: [:show, :edit, :update, :destroy]
  before_action :set_markers, only: [:index, :new, :create]

  respond_to :html

  def index
    respond_with(:dashboard, @outdoors)
  end

  def show
    @hash = Gmaps4rails.build_markers(@outdoor) do |outdoor, marker|
      marker.infowindow render_to_string(partial: "/maps/outdoors/infowindow", locals: { :outdoor => outdoor})
      marker.lat outdoor.latitude
      marker.lng outdoor.longitude
      marker.title   outdoor.code
      marker.picture({ 
        url:    view_context.image_path("marcador32.png"),
        width:  32,
        height: 32
      })
    end
    respond_with(:dashboard, @outdoor)
  end

  def new
    @outdoor = Outdoor.new
    authorize  @outdoor

    respond_with(:dashboard, @outdoor)
  end

  def edit
    @outdoors = Outdoor.where.not(id: @outdoor)
    @hash = Gmaps4rails.build_markers(@outdoors) do |outdoor, marker|
      marker.lat outdoor.latitude
      marker.lng outdoor.longitude
      marker.title   outdoor.code
      marker.picture({ 
        url:    view_context.image_path("marcador32.png"),
        width:  32,
        height: 32
      })
    end
  end

  def create
    @outdoor = Outdoor.new(outdoor_params)
    authorize  @outdoor
    @outdoor.media_company = current_user.person.profile
    @outdoor.save
    respond_with(:dashboard, @outdoor)
  end

  def update
    @outdoor.update(outdoor_params)
    respond_with(:dashboard, @outdoor)
  end

  def destroy
    @outdoor.destroy
    respond_with(:dashboard, @outdoor)
  end

  private
    def set_outdoor
      @outdoor = Outdoor.find(params[:id])
      authorize  @outdoor
    end

    def set_markers
      @outdoors = Outdoor.all
      authorize  @outdoors
      @hash = Gmaps4rails.build_markers(@outdoors) do |outdoor, marker|
        marker.infowindow render_to_string(partial: "/maps/outdoors/infowindow", locals: { :outdoor => outdoor})
        marker.lat outdoor.latitude
        marker.lng outdoor.longitude
        marker.title   outdoor.code
        marker.picture({ 
          url:    view_context.image_path("marcador32.png"),
          width:  32,
          height: 32
        })
      end
    end

    def outdoor_params
      params.require(:outdoor).permit(:image, :code, :description, :address, :latitude, :longitude, :price, :avaliable)
    end
end
