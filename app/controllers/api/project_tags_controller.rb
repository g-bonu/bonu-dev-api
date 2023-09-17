# frozen_string_literal: true

module Api
  class ProjectTagsController < ApplicationController
    def index
      render_result(ProjectTags::ListProjectTagsOp.call(params:))
    end
  end
end