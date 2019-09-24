class Api::V1::Stores::BranchesController < ApplicationController
  before_action :authenticate_user!
  def index
    @branches = Branch.all
    render json: @branches
  end

  def show
    respond_with @branch
  end

  def create
    @branch = Branch.create(create_params)
    if @branch.save
      render json: @branch, status: :created, location: api_v1_branch_url(@branch)
    else
      render json: @branch.errors, status: :unprocessable_entity
    end
  end

  def update
    @branch.update(create_params)
    respond_with @branch
  end

  private
  def create_params
    params.require(:branch).permit(:branch_name, :address, :phone, :township, :status, :capability, :category, :lat, :lng)
  end
end
