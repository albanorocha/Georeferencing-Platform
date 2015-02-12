class HomeController < ApplicationController
	
  respond_to :html

  def index
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

  private

    def contractor_params
      params.require(:contractor).permit( :cnpj, 
      :person_attributes => [:name, :telephone, 
        :user_attributes => [:email, :password, :password_confirmation]] )
    end
end
