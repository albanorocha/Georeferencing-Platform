module LegalProfilesHelper
	def sti_legal_profile_path(type = "legal_profile", legal_profile = nil, action = nil)
	  send "#{format_sti(action, type, legal_profile)}_path", legal_profile
	end

	def format_sti(action, type, legal_profile)
	  	action || legal_profile ? "#{format_action(action)}dashboard_#{type.underscore}" : "dashboard_#{type.underscore.pluralize}"
	end

	def format_action(action)
	  action ? "#{action}_" : ""
	end
end
