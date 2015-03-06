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

  def agency?
  	person.profile.type == 'Agency'  	
  end

  def advertiser?
    person.profile.type == 'Advertiser'   
  end


  def manager?
  	person.profile.type == 'Manager'  	
  end
  #-----------------------------#

  def employer?
  	person.profile_type == 'LegalProfile'  	
  end

  def is_role? (role)
    self.person.profile.type == role.to_s.camelize
  end

  def role?
    person.profile.type
  end
end
