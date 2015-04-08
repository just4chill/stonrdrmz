
class Dataa < ActiveRecord::Base
	belongs_to 	:thing
	belongs_to 	:parent, 	:class_name 	=> "Dataa", foreign_key: :parent_id
	has_many	:childrens, :class_name 	=> "Dataa", foreign_key: :parent_id
end
