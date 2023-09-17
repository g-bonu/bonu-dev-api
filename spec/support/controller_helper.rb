# frozen_string_literal: true

module ControllerHelper
  def response_body
    JSON.parse(response.body).with_indifferent_access
  end

  def authenticate_admin
    admin = create(:admin, email: 'admin1@test.com', password: 'password')
    sign_in admin
  end
end
