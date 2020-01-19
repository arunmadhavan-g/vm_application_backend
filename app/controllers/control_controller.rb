class ControlController < ApplicationController
  before_action :authenticate_admin!, except: :started

  def started
    render json: Control.find(1)
  end

  def start
    render json: Control.update({id: 1, started: true})
  end

  def stop
    render json: Control.update({id: 1, started: false})
  end
end
