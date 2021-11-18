module ApplicationHelper
	def login_helper style
		#if current_user.is_a?(GuestUser)
		#	(link_to "Register", new_user_registration_path) +
		#	"<br>".html_safe +
		#	(link_to "Login", new_user_session_path)
		#else
     # link_to "Logout", destroy_user_session_path, method: :delete
		#end
		 if current_user
    	link_to "Logout", destroy_user_session_path, method: :delete, class: style
    	
    else
		  (link_to "Register", new_user_registration_path, class: style)
		  (link_to "Login", new_user_session_path, class: style) 
     end
	end

	def source_helper(layout_name)
		if session[:source]
			greeting = "Thanks for Visiting me from #{session[:source]} and you are on #{layout_name} layout"
		end
	end

	def copyrights_generator
		AmenyaViewTool::Renderer.copyright 'Zaccheaus Amenya', 'All rights reserved'
	end
end

