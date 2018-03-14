module ApplicationHelper
  # returns the count of users
  def get_user_count
    User.all.count
  end

  # returns the count of sales users
  def get_sales_user_count
    User.where("role = ?", "Sales-consultant").count + User.where("role = ?", "Sales-BDE").count
  end

  # returns the count of client users
  def get_clients_count
    User.where("role = ?", "Client").count 
  end

  # returns the count of projects
  def projects_count
    ProjectDetail.all.count
  end

  def unread_notifications_count
    Notification.unread_by(current_user).count
  end

# returns the count of total nil status
 def pending_leave_count
    Holiday.where(:status => nil).count
  end

# returns the count of total nil status of current user
 def employee_pending_leave_count
    current_user.holidays.where(:status => nil).count
  end

# returns employee details it is used in leave edit and show page 
  def employee_details
    EmployeeDetail.find_by_user_id(@holiday.user_id)
  end
  
end
