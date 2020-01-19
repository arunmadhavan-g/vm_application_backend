class ApplicationFormController < ApplicationController

  before_action :authenticate_admin!, except: [:find_by_phone, :create]

  def index
    render json: Application.all
  end

  def show
    application = Application.find_by(params[:id])
    if application.present?
      render json: application
    else
      render json: {error: "Not Found"}, status: :not_found
    end
  end

  def find_by_phone
    application = Application.find_by({phone: params[:phone]})
    if application.present?
      render json: application
    else
      render json: {error: "Not Found"}, status: :not_found
    end
  end

  def create
    application = Application.create(allowed_params)
    if application.errors.present?
      render json: application.errors.full_messages, status: :unprocessable_entity
    else
      render json: application
    end
  end

  private

  def allowed_params
    allowed_params = {
        name: params[:name],
        dob: Date.parse(params[:dob]),
        sex: params[:sex],
        name_father: params[:name_father],
        name_mother: params[:name_mother],
        address: params[:address],
        is_alumni: params[:is_alumni],
        has_siblings: params[:has_sibling],
        email: params[:email],
        phone: params[:phone]
    }
    alumni = params[:alumni]
    sibling = params[:sibling]

    allowed_params[:alumni_details] = {relationship: alumni[:relationship], year_of_passing: alumni[:year_of_passing], reg_no: alumni[:reg_no]} if alumni.present?
    allowed_params[:sibling_details] = {relationship: sibling[:relationship], year_of_admission: sibling[:year_of_admission], reg_no: sibling[:reg_no]} if sibling.present?

    allowed_params
  end

end
