# frozen_string_literal: true

module Api
  module Admin
    class ProjectTagsController < Api::AdminController
      def index 
        render_result(ProjectTags::ListProjectTagsOp.call(params:))
      end

      def create 
        render_result(ProjectTags::CreateProjectTagOp.call(params:))
      end

      def destroy
        render_result(ProjectTags::DestroyProjectTagOp.call(params:))
      end
    end
  end
end