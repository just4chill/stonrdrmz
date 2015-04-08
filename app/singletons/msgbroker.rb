
require 'singleton'

class MsgBroker

	include Singleton

	def initialize
		@conn = Bunny.new
		@conn.start
		@chann 		= @conn.create_channel
		@xchange  	= @chann.default_exchange
		@post_queue = @chann.queue("user.post.new", :auto_delete => true)
	end

	def channel
		return @chann
	end

	def postqueue
		return @post_queue
	end

	def default_xchange
		return @xchange
	end

end
