class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
    
    # Apply search if present
    if params[:search].present?
      @companies = @companies.where("name ILIKE :search OR 
                    email ILIKE :search OR 
                    phone ILIKE :search OR 
                    contact_person ILIKE :search",
                    search: "%#{params[:search]}%")
    end
    
    # Apply sorting
    sort_column = %w[name contact_person email phone].include?(params[:sort]) ? params[:sort] : "name"
    sort_direction = %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    
    @companies = @companies.order("#{sort_column} #{sort_direction}")
  end

  def show
  end

  def new
    @company = Company.new
    @company.build_billing_address
    @company.build_shipping_address
  end

  def edit
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to @company, notice: 'Company was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @company.update(company_params)
      redirect_to @company, notice: 'Company was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_url, notice: 'Company was successfully deleted.'
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(
      :name, :email, :phone, :contact_person,
      billing_address_attributes: [:id, :street, :city, :state, :postal_code, :country, :address_type],
      shipping_address_attributes: [:id, :street, :city, :state, :postal_code, :country, :address_type]
    )
  end
end
