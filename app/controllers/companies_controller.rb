class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show]

  def index
    @companies = Company.all
  end

  def create
    @company = Company.new(company_params)
    @company.save!
    respond_to do |format|
      format.js #default behaviour is to run app/views/notes/create.js.erb file
    end
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :description, :location)
    end
end
