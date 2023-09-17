# frozen_string_literal: true

module Projects
  class FindProjectOp < BaseOp
    def call(params:)
      # find project
      project = Project.find(params[:id])

      # render response
      response = ProjectBlueprint.render_as_hash(project)

      Success(response)
    end
  end
end
