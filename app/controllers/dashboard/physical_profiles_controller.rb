class Dashboard::PhysicalProfilesController < Dashboard::DashboardController
  before_action :set_physical_profile, only: [:show, :edit, :update, :destroy]
  before_action :set_type

  respond_to :html

  def index
    @physical_profiles = type_class.all
    authorize  @physical_profiles
    respond_with(:dashboard, @physical_profiles)
  end

  def show
    respond_with(:dashboard, @physical_profile)
  end

  def new
    @physical_profile = type_class.new
    authorize  @physical_profile
    @physical_profile.build_person
    @physical_profile.person.build_user
    respond_with(:dashboard, @physical_profile)
  end

  def edit
  end

  def create
    @physical_profile = type_class.new(physical_profile_params)
    @physical_profile.employer = current_user.person.profile
    authorize  @physical_profile
    @physical_profile.save
    respond_with(:dashboard, @physical_profile)
  end

  def update
    @physical_profile.update(physical_profile_params)
    respond_with @physical_profile do |format|
      format.html {redirect_to dashboard_physical_profiles_path, notice: "Atualizado com sucesso"}
    end 
  end

  def destroy
    @physical_profile.destroy
    respond_with(:dashboard, @physical_profile)
  end

  private
    def set_physical_profile
      @physical_profile = type_class.find(params[:id])
      authorize  @physical_profile
    end

    def set_type 
       @type = type 
    end

    def type
      PhysicalProfile.types.include?(params[:type]) ? params[:type] : "PhysicalProfile"
    end

    def type_class
      type.constantize 
    end

    def physical_profile_params
      params.require(type.underscore.to_sym).permit(:cpf, :type, 
      :person_attributes => [:name, :telephone, 
        :user_attributes => [:email, :password, :password_confirmation] ])
    end
end
