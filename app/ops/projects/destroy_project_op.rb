# frozen_string_literal: true

module Projects
  class DestroyProjectOp < BaseOp
    def call(params:)
      # find project
      project = Project.find(params[:id])

      # destroy project
      project.destroy!

      Success()
    end
  end
end
