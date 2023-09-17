# frozen_string_literal: true

module Api
  class ProjectImagesController < ApplicationController
    def index
      render_result(ProjectImages::ListProjectImagesOp.call(params:))
    end
  end
end