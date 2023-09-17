# frozen_string_literal: true

class ApplicationController < ActionController::API
  respond_to :json

  # render monad result values from operations
  def render_result(result, status: :ok)
    if result.success?
      case result.value!
      when Dry::Monads::Success().value!
        head status
      else
        render json: result.value!, status:
      end
    else
      render json: { message: result.failure }, status: :bad_request
    end
  end
end
