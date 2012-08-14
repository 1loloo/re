module AdsHelper
	def show_errors(obj, att)
		if obj.errors.any? and obj.errors.messages.has_key?(att)
			obj.errors.messages.fetch(att).join(", ") 
		end
	end
end
