require 'net/http'
require 'nokogiri'
require 'awesome_print'

class URLScraper

	def initialize(_uri)
		@uri = URI(_uri)
	end

	def crawl
		puts "Crawling started"
		doc = Nokogiri::HTML(open(@uri))
		img = doc.css("img").first
		title = doc.xpath("//title")

		puts img
		puts title
	end
	
end