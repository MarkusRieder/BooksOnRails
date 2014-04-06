class Profile < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :address, :background, :category, :description, :email, :firstname, :lastname, :avatar, :aboutyourself, :name, :phone, :user_id
 

end
