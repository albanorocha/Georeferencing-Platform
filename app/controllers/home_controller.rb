class HomeController < ApplicationController
  respond_to :html

  def index
    @contact = Contact.new
  end

  def contractor_sign_up
  	@contractor = Contractor.new
  	@contractor.build_person
  	@contractor.person.build_user
  end

  def contractor_create
  	@contractor = Contractor.new(contractor_params)
  	@contractor.save
  	@user = @contractor.person.user
  	sign_in @user
  	respond_with @contractor do |format|
      format.html {redirect_to dashboard_root_path, notice: "Cadastrado com sucesso!"}
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

    def contractor_params
      params.require(:contractor).permit( :cnpj, 
      :person_attributes => [:name, :telephone, 
        :user_attributes => [:email, :password, :password_confirmation]] )
    end
end
