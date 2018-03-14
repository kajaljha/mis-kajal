module SalesHelper

	def get_client(client_assigned)
		User.find(client_assigned).email
	end

	def get_employee(emp_id)
		User.find(emp_id).first_name
	end
	# def employee_details
 #    EmployeeDetail.find_by_user_id(@sale.user_id)
 #  end
end
