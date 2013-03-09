module ApplicationHelper
	def full_title(page_title)
		base_title = 'ZWB'
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

class Numeric
  def percent
   self / 100.0
  end
 end

end

