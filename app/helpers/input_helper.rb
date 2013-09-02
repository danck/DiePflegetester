module InputHelper
	def make_safe_for(symbol, i_string)
		case symbol
		when :html
			return make_html_safe i_string
		when :sql
			return make_html_safe i_string
		else
			logger.debug "Symbol: #{symbol} is not a known switch"
		end
	end

	private

		# TODO: This method seems to be obsolete as Rails escapes params by default
		def make_html_safe i_string
			# CGI::escapeHTML i_string.to_s
			i_string
		end
end