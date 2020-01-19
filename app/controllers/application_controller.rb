class ApplicationController < ActionController::API
  respond_to :json
  include Devise::Controllers::Helpers

  skip_before_action :verify_authenticity_token, raise: false unless defined?(verify_authenticity_token).nil?

  rescue_from Exception, with: :server_error
  rescue_from StandardError, with: :server_error
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from JWT::VerificationError, with: :unauthorized_request

  def unauthorized_request
    render json: {message: 'Not Authorized'}, status: :unauthorized
  end

  def not_found
    render json: {message: 'Not found'}, status: :not_found
  end

  def server_error(error)
    logger.error error
    render json: {message: 'Server error'}, status: :internal_server_error
  end

end
