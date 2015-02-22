class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :registerable, 
  		 :rememberable, :trackable, :validatable

  belongs_to :person

  # Todo Compile this methods
  def media_company?
  	person.profile.type == 'MediaCompany'  	
  end

  def contractor?
  	person.profile.type == 'Contractor'  	
  end

  def manager?
  	person.profile.type == 'Manager'  	
  end
  #-----------------------------#

  def employer?
  	person.profile_type == 'LegalProfile'  	
  end

end
