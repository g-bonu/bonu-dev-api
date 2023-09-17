# frozen_string_literal: true

module Api
  module Admin
    class ProjectsController < Api::AdminController
      def index
        render_result(Projects::ListProjectsOp.call)
      end

      def show
        render_result(Projects::FindProjectOp.call(params:))
      end

      def create
        render_result(Projects::CreateProjectOp.call(params:))
      end

      def update
        render_result(Projects::UpdateProjectOp.call(params:))
      end

      def destroy
        result = Projects::DestroyProjectOp.call(params:)
        render_result(result)
      end
    end
  end
end
