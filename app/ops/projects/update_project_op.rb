# frozen_string_literal: true

module Projects
  class UpdateProjectOp < BaseOp
    def call(params:)
      transaction do
        # find project
        project = Project.find(params[:id])

        # update project
        project.update!(
          start_year: params[:start_year],
          end_year: params[:end_year],
          title: params[:title],
          organization: params[:organization],
          description: params[:description]
        )

        # render response
        response = ProjectBlueprint.render_as_hash(project)

        # success
        Success(response)
      end
    end
  end
end
