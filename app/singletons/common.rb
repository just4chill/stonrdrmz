
require 'singleton'

class Common

	include Singleton

	def category
		return 	Thing.find_by!(name: "category")
            	.dataas.all()
	end

	def topics
		return 	Thing.find_by!(name: "topics")
            	.dataas.all()
	end

end

