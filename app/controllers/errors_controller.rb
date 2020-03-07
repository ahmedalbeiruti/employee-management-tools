# frozen_string_literal: true

class ErrorsController < ApplicationController
  def routing_error
    raise ActionController::RoutingError, 'Routing Error'
  end
end
