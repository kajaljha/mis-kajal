module UsersHelper
	def client_name(client_id)
		User.find(client_id).first_name
	end
end
