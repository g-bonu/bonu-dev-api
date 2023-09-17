# frozen_string_literal: true

module Projects
  class ListProjectsOp < BaseOp
    def call
      # find all projects
      projects = Project.includes(:project_tags).all.order(start_year: :desc)

      # render response
      response = ProjectBlueprint.render_as_hash(projects)

      Success(response)
    end
  end
end
