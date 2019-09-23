class Api::V1::CustomersController < ApplicationController
  # include Pagy::Backend

  # load_resource except: :create
  before_action :authenticate_user!

  def index
    # @customers = Customer.all
    # @q = @customers.ransack(params[:q])
    # @pagy, @customers = pagy(@q.result, items: params[:per_page], page: params[:page])
    # set_paging_header(@pagy)
    # respond_with @customers
    @customers = Customer.all
  render json: @customers
  end

  def show
    respond_with @customer
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render json: @customer, status: :created, location: api_v1_customer_url(@customer)
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  def update
    @customer.update(update_param)
    respond_with @customer
  end

  def destroy
    @customer.destroy
    respond_with @customer
  end

  private

  def customer_params
    params.require(:customer).permit(:id, :display_name, :email_address, :phone_number, :points, :coupons, :stores)
  end

  def update_param
    params.require(:customer).permit(:display_name, :points, :coupons, :stores)
  end
end
