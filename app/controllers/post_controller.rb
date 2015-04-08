
require 'uri'
require 'msgbroker'
require 'urlscraper'

class PostController < ApplicationController


	def show
		@id 			= params[:id].to_i
		@dat 			= Thing.find_by!(name: "post_url").dataas.find_by!(id: @id)
		@thing_img 		= Thing.find_by!(name: "post_img")
		@thing_title 	= Thing.find_by!(name: "post_title")

		@resp = {
			:id => @dat.id,
			:title => @thing_title.dataas.find_by!(parent_id: @dat.id).value,
			:img => @thing_img.dataas.find_by!(parent_id: @dat.id).value
		}
	end

	def create		
		if params[:value] =~ URI::regexp
			#@post = Thing.find_by!(name: "post_url").dataas.create!(post_params)

			# Publish to exchange
			# MsgBroker.instance.default_xchange().publish(@post.id.to_s, :routing_key => 
			# MsgBroker.instance.postqueue().name
			# )
			val = params[:value]
			MsgBroker.instance.default_xchange().publish(val, :routing_key => 
			MsgBroker.instance.postqueue().name
			)
			redirect_to root_url
		else
			puts "Error"
			redirect_to root_url
		end
	end



	MsgBroker.instance.postqueue().subscribe do |delivery_info, metadata, payload|
		puts "Message received"
		puts payload
		# _obj = JSON.parse(payload)
		# puts "Message received"
		# ap _obj
		# puts _obj[:value]
		crawler = URLScraper.new(payload)
		crawler.crawl()
	end	

	private

	def post_params
		params.permit(:value)
	end

end
