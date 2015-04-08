
module ApplicationHelper

	def full_title(page_title = '')
		base_title = 'Stonr Drmz'
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end

	def post_link(link = '')
		"/post/" + link.downcase
	end
end
