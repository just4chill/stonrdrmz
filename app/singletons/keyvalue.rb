
class KeyValueCache

	def initialize
		@keycache = Redis.new
	end

	@@keycache = KeyValueCache.new

	def self.instance
		return @@keycache
	end

	private_class_method :new

end