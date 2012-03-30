module SessionsHelper

	def sign_out
		current_user = nil
		session.delete(:cas_user)
		flash[:notice] = "</pre>You have signed out. To sign out of Yale CAS, <a href=\"https://secure.its.yale.edu/cas/logout\"> click here.</a>"
		redirect_to root_path
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user
		@current_user ||= user_from_netid
	end

	def current_user?(user)
		user == current_user
	end

	def user_from_netid
		netid = session[:cas_user]
		@current_user = User.find_by_netid(netid) unless netid.nil?
	end

	protected
		
		def current_user=(user)
			@current_user = user
		end

end
