class Canva < ActiveRecord::Base
  has_attached_file :image, :styles => { :large => "900x900>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
