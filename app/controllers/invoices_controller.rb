class InvoicesController < ApplicationController
  before_filter :get_sales_user

  def index
    if current_user.role == "Sales-consultant" || current_user.role == "Sales-BDE"
      @invoices = Invoice.search(params[:search])
      respond_to do |format|
        format.html
        format.pdf do
          pdf = ReportPdf.new(@invoices)
          send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
        end
      end
    elsif current_user.role == "Client"
      @invoices = Invoice.where("bill_to=?",current_user.first_name).search(params[:search])
      respond_to do |format|
        format.html
        format.pdf do
          pdf = ReportPdf.new(@invoices)
          send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
        end
      end
    end 
  end

  def new
    @invoice = @sales_user.invoices.build 
  end

  def create
    @invoice = @sales_user.invoices.build(invoice_params)
    if @invoice.save
      Invoice.client_mail(params[:client_name],@invoice)
      redirect_to user_invoices_path(current_user), :notice => "Invoice has been created successfully!"
    else
      render 'new'
    end
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def edit
    @invoice = @sales_user.invoices.find(params[:id])
  end

  def update
    @invoice = @sales_user.invoices.find(params[:id])
    if @invoice.update_attributes(invoice_params)
      redirect_to user_invoices_path,:notice => "Invoice has been updated successfully!"
    else
      render "edit"
    end
  end

  def destroy
    @invoice = @sales_user.invoices.find(params[:id])
    @invoice.destroy
    redirect_to user_invoices_path
  end

  def get_client_location
    if ClientBasicDetail.find_by_user_id(params["client_id"]).present? 
      @location = ClientBasicDetail.find_by_user_id(params["client_id"]).location
    else
      @location = "US"
    end 
    respond_to do |format|
      format.json {render json: {:location => @location, :status => :ok}}
    end
  end

  def paid_invoice_list
  	@invoices = Invoice.search(params[:search])
  	@paid_invoices = Invoice.where("status =?", true)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReportPdf.new(@invoices)
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
      end
    end
  end

  def unpaid_invoice_list
  	@invoices = Invoice.search(params[:search])
  	@unpaid_invoices = Invoice.where("status =?", false)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReportPdf.new(@invoices)
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
      end
    end
  end

  private

  def get_sales_user
    @sales_user = current_user
  end

  def invoice_params
    params.require(:invoice).permit(:user_id, :invoice_date, :invoice_number, :bill_to, :currency, :tax, :discount, :due_date, :note, :status, invoice_items_attributes: [:id, :invoice_id, :item, :description, :unit_cost, :quantity, :price, :_destroy])
  end

end
