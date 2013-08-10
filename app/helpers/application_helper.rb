module ApplicationHelper
	# Returns full title per page
	def full_title(page_title)
		base_title = "Die Pflegetester"
		if page_title.empty?
			return base_title
		else
			return "#{base_title} | #{page_title}"
		end
	end
end