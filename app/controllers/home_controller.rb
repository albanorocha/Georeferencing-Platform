class HomeController < ApplicationController
  def index
  	@contact = Contact.new
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
end
