class Canva < ActiveRecord::Base
  has_attached_file :avatar, :default_url => "/images/missing.png"

end
