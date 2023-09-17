# frozen_string_literal: true

module Api
  module Admin
    class ProjectImagesController < Api::AdminController
      def index
        render_result(ProjectImages::ListProjectImagesOp.call(params:))
      end

      def create
        render_result(ProjectImages::CreateProjectImageOp.call(params:))
      end

      def destroy
        render_result(ProjectImages::DestroyProjectImageOp.call(params:))
      end
    end
  end
end