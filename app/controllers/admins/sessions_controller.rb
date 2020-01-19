class Admins::SessionsController < Devise::SessionsController
  clear_respond_to
  respond_to :json

  def create
    p params
    super
  end
end
