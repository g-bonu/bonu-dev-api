# frozen_string_literal: true

module Api
  class AdminController < ApplicationController
    before_action :authenticate_admin!
  end
end
