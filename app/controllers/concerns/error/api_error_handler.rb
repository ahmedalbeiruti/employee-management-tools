# frozen_string_literal: true

module Error
  module ApiErrorHandler
    extend ActiveSupport::Concern

    included do
      rescue_from ActiveRecord::RecordNotFound do |_exception|
        render json: { status: 'Error', message: 'Not Found' },
               status: :not_found
      end

      rescue_from ActionController::RoutingError do |exception|
        render json: { status: 'Error', message: exception.message },
               status: :not_found
      end
    end
  end
end
