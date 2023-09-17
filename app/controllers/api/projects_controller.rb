# frozen_string_literal: true

module Api
  class ProjectsController < ApplicationController
    def index
      render_result(Projects::ListProjectsOp.call)
    end

    def show
      render_result(Projects::FindProjectOp.call(params:))
    end
  end
end
