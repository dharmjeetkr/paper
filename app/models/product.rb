class Product < ActiveRecord::Base
	has_many :attach

validates :name, :description, :image, presence: true

has_attached_file :image, styles: {large: "200x200>", medium: "150x150>", thumb: "100x100>"}
validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/



end
