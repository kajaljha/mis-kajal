class SalesController < ApplicationController

  def sales_bde_new
    @sale = current_user.sales_bdes.new
  end

  def sales_bde_create
    @sale = current_user.sales_bdes.create(sale_params)
    if @sale.save
      redirect_to sales_bde_display_user_sales_path(current_user), :notice => "Details saved."
    else
      render 'sales_bde_new'
    end
  end

  def sales_bde_display
    if current_user.sales_bdes.blank?
      redirect_to  sales_bde_new_user_sales_path(current_user)
    else
      @sale = current_user.sales_bdes
    end 
  end 

  def sales_bde_edit
    @sale = current_user.sales_bdes.find(params[:bdes])
  end

  def sales_bde_update
     @sale = current_user.sales_bdes.find(params[:bdes])
       if @sale.update_attributes(sale_params)
         redirect_to sales_bde_display_user_sales_path(current_user)
       else
         render 'sales_bde_edit'
      end
  end

  def sales_consultant_display
    if current_user.sales_consultants.blank?
      redirect_to sales_consultant_new_user_sales_path(current_user)
    else
      @consultants = current_user.sales_consultants
    end
  end

  def sales_consultant_new
    @consultant = current_user.sales_consultants.new
  end

  def sales_consultant_edit
    @consultant = current_user.sales_consultants.find(params[:consultants])
  end

  def sales_consultant_update
    @consultant = current_user.sales_consultants.find(params[:consultants])
      if @consultant.update_attributes(sales_params)
        redirect_to sales_consultant_display_user_sales_path(current_user)
      else
        render 'client_project_details_edit'
      end
  end

  def sales_consultant_create
    @consultant = current_user.sales_consultants.create(sales_params)
    if @consultant.save
      redirect_to sales_consultant_display_user_sales_path(current_user), :notice => "Details saved."
    else
      render "sales_consultant_new"
    end
  end


  def client_project_details_display
    if current_user.role != "Client"
      if params[:assigned_id].present?
        @client_user = User.find(params[:assigned_id])
        if @client_user.client_project_details.blank?
          redirect_to client_project_details_new_user_sales_path(current_user, :assigned_id=>@client_user)
        else
          @project_details = @client_user.client_project_details
        end
      else
        if current_user.client_project_details.blank?
          redirect_to client_lists_user_sales_path(current_user)
        else
          @project_details = current_user.client_project_details
        end
      end  
    else
      @project_details = current_user.client_project_details
    end
  end
  
  def client_project_details_new
    @client_user = User.find(params[:assigned_id])
    @project_detail = @client_user.client_project_details.new
  end

  def client_project_details_create
    @client_user = User.find(params[:assigned_id])
    @project_detail = @client_user.client_project_details.create(client_project_params)
    if  @project_detail.save
      redirect_to client_project_details_display_user_sales_path(current_user, :assigned_id=>@client_user), :notice => "Details saved."
    else
      render "client_project_details_new"
    end
  end

  def client_project_details_edit
    @client_user = User.find(params[:assigned_id])
    @project_detail = @client_user.client_project_details.find(params[:clientproject])
  end

  def client_project_details_update
    @client_user = User.find(params[:assigned_id])
    @project_detail = @client_user.client_project_details.find(params[:clientproject])
      if @project_detail.update_attributes(client_project_params)
        redirect_to client_project_details_display_user_sales_path(current_user, :assigned_id=>@client_user)
      else
        render 'client_project_details_edit'
      end
  end

   def client_project_details_destroy
   @project_detail = ClientProjectDetail.find(params[:id])
   @project_detail.destroy
    redirect_to client_project_details_display_user_sales_path(current_user), notice: "User deleted."
  end

  def client_contact_details_new
    @contact_detail = current_user.build_client_contact_detail
  end

  def client_contact_details_edit
    @contact_detail = current_user.client_contact_detail
  end

  def client_contact_details_display
    if current_user.client_contact_detail.blank?
      redirect_to client_contact_details_new_user_sales_path(current_user)
    elsif current_user.client_contact_detail.present?
      @contact_detail = current_user.client_contact_detail
    end
  end

  def client_contact_details_create
    @contact_detail = current_user.build_client_contact_detail(client_contact_params)
    if @contact_detail.save
      redirect_to client_contact_details_display_user_sales_path(current_user), :notice => "Details saved."
    else
      render "client_contact_details_new"
    end
  end

  def client_contact_details_update
    @contact_detail = current_user.client_contact_detail
      if @contact_detail.update_attributes(client_contact_params)
       redirect_to client_contact_details_display_user_sales_path
      else
       render "client_contact_details_edit"
     end
  end
  
  def client_assigned_resources_display
    if current_user.role != "Client"
      @client_user = User.find(params[:assigned_id])
      if @client_user.client_assigned_resources.blank?
       redirect_to client_assigned_resources_new_user_sales_path(current_user, :assigned_id=>@client_user)
      else
        @client_assigned = @client_user.client_assigned_resources
      end
    else
      @client_assigned = current_user.client_assigned_resources
    end
  end
  
  def client_assigned_resources_new
    @client_user = User.find(params[:assigned_id])
    @client_assigned = @client_user.client_assigned_resources.new
  end
   
  def client_assigned_resources_create
    @client_user = User.find(params[:assigned_id])
    @client_assigned = @client_user.client_assigned_resources.new(client_assigned_params)
    if  @client_assigned.save
      redirect_to client_assigned_resources_display_user_sales_path(current_user, :assigned_id=>@client_user), :notice => "Details saved."
    else
      render "client_assigned_resources_new"
    end
  end
 
  def client_assigned_resources_edit
    @client_user = User.find(params[:assigned_id])
    @client_assigned = @client_user.client_assigned_resources.find(params[:clientresource])
  end

  def client_assigned_resources_update
    @client_user = User.find(params[:assigned_id])
    @client_assigned = @client_user.client_assigned_resources.find(params[:clientresource])
      if @client_assigned.update_attributes(client_assigned_params)
        redirect_to client_assigned_resources_display_user_sales_path(current_user, :assigned_id=>@client_user)
      else
        render 'client_assigned_resources_edit'
      end
  end

  def client_basic_detail_new
    @client = current_user.build_client_basic_detail
  end 

  def client_basic_detail_edit
    @client = current_user.client_basic_detail
  end

  def client_basic_detail_display
    if current_user.client_basic_detail.blank?
      redirect_to client_basic_detail_new_user_sales_path(current_user)
    elsif current_user.client_basic_detail.present?
      @client = current_user.client_basic_detail
    end
  end

  def client_basic_detail_create
    @client = current_user.build_client_basic_detail(client_params)
    if @client.save
      redirect_to client_basic_detail_display_user_sales_path(current_user), :notice => "Details saved."
    else
      render 'client_basic_detail_new'
    end
  end

  def client_basic_detail_update
    @client = current_user.client_basic_detail
      if @client.update_attributes(client_params)
        redirect_to client_basic_detail_display_user_sales_path
      else
        render "client_basic_detail_edit"
     end
  end

  def client_payment_detail_display
    if current_user.role != "Client"
      @client_user = User.find(params[:assigned_id])
      if @client_user.client_payment_detail.blank?
        redirect_to client_payment_detail_new_user_sales_path(current_user, :assigned_id=>@client_user)
      else
        @clients = @client_user.client_payment_detail
      end
    else
      @clients = current_user.client_payment_detail
    end
  end

  def client_payment_detail_new
    @client_user = User.find(params[:assigned_id])
    @clients = @client_user.build_client_payment_detail
  end

  def client_payment_detail_create
    @client_user = User.find(params[:assigned_id])
    @clients = @client_user.build_client_payment_detail(clients_params)
     if @clients.save
       redirect_to client_payment_detail_display_user_sales_path(current_user,:assigned_id=>@client_user), :notice => "Details saved."
     else
       render 'client_payment_detail_new'
    end
  end
 
  def client_payment_detail_edit
    @client_user = User.find(params[:assigned_id])
    @clients = @client_user.client_payment_detail
  end

  def client_payment_detail_update
    @client_user = User.find(params[:assigned_id])
    @clients = @client_user.client_payment_detail
      if @clients.update_attributes(clients_params)
        redirect_to client_payment_detail_display_user_sales_path(current_user,:assigned_id=>@client_user)
      else
        render "client_payment_detail_edit"
      end
  end

  def client_lists
    @clients = User.where("role=?","Client")
  end 

  private
    def sales_params
      params.require(:sales_consultant).permit(:user_id, :name, :commission, :contact,:skype_id, :email_id,:location, :address,:bank_account_no,:bank_name,:branch_name,:ifsc_code)
    end

    def sale_params
      params.require(:sales_bde).permit(:sales_id, :skype_id)
    end

    def client_project_params
      params.require(:client_project_detail).permit(:user_id,:sales_id,:project_name, :description, :technologies,:project_start_date, :estimated_end_date,:project_type,:currency_type,:employee_id)
    end

    def client_contact_params
      params.require(:client_contact_detail).permit(:user_id, :skype_id, :personal_email_id, :official_email_id,:phone_no)
    end

    def client_assigned_params
      params.require(:client_assigned_resource).permit(:user_id, :sales_id,:company_name, :location, :designation)
    end

    def client_params
      params.require(:client_basic_detail).permit(:name, :location)
    end

    def clients_params
      params.require(:client_payment_detail).permit(:payment_mode, :sales_id,:payment_amount, :payment_date)
    end
end
