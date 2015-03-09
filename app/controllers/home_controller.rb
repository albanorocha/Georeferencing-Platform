class HomeController < ApplicationController
  respond_to :html

  def index
    @contact = Contact.new
  end

  def agency_sign_up
  	@agency = Agency.new
  	@agency.build_person
  	@agency.person.build_user
  end

  def agency_create
  	@agency = Agency.new(agency_params)
    respond_to do |format|
      if @agency.save
        sign_in @agency.person.user
        flash[:notice] = 'User was successfully created.'
        format.html { redirect_to(dashboard_root_path) }
      else
        format.html { render action: "agency_sign_up" }
      end
    end
  end

  def mensage_sent
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Obrigado. Mensagem enviada com Sucesso!!!'
    	render "index"
    else
      	flash.now[:error] = 'Mensagem não pode ser enviada.'
      	render "index"
    end
  end


  private

    def agency_params
      params.require(:agency).permit( :cnpj, 
      :person_attributes => [:name, :telephone, 
        :user_attributes => [:email, :password, :password_confirmation]] )
    end
end
