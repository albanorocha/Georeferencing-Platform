module PhysicalProfilesHelper
	def sti_physical_profile_path(type = "physical_profile", physical_profile = nil, action = nil)
	  send "#{format_sti(action, type, physical_profile)}_path", physical_profile
	end

	def format_sti(action, type, physical_profile)
	  	action || physical_profile ? "#{format_action(action)}dashboard_#{type.underscore}" : "dashboard_#{type.underscore.pluralize}"
	end

	def format_action(action)
	  action ? "#{action}_" : ""
	end
end
