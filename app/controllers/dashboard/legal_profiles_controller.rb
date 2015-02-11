class Dashboard::LegalProfilesController <  Dashboard::DashboardController
  before_action :set_legal_profile, only: [:show, :edit, :update, :destroy]
  before_action :set_type

  respond_to :html

  def index
    @legal_profiles = type_class.all
    respond_with(:dashboard, @legal_profiles)
  end

  def show
    respond_with(:dashboard, @legal_profile)
  end

  def new
    @legal_profile = type_class.new
    puts @legal_profile.class
    @legal_profile.build_person
    @legal_profile.person.build_user
    respond_with(:dashboard, @legal_profile)
  end

  def edit
  end

  def create
    @legal_profile = type_class.new(legal_profile_params)
    @legal_profile.save
    respond_with(:dashboard, @legal_profile)
  end

  def update
    @legal_profile.update(legal_profile_params)
    respond_with(:dashboard, @legal_profile)
  end

  def destroy
    @legal_profile.destroy
    respond_with(:dashboard, @legal_profile)
  end

  private
    def set_legal_profile
      @legal_profile = type_class.find(params[:id])
      #@legal_profile = LegalProfile.find(params[:id])
    end

    def set_type 
       @type = type 
    end

    def type
      LegalProfile.types.include?(params[:type]) ? params[:type] : "LegalProfile"
    end

    def type_class
      type.constantize 
    end

    def legal_profile_params
      params.require(type.underscore.to_sym).permit(:cnpj, :type,
                                            :person_attributes => [:name, :telephone, 
                                                                   :user_attributes => [:email, :password, :password_confirmation] 
                                                                   ])
    end
end
