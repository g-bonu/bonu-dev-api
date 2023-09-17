module ProjectTags
  class CreateProjectTagOp < BaseOp
    def call(params:)
      # find project
      project = Project.find(params[:project_id])

      # create project tag
      project_tag = project.project_tags.create!(
        name: params[:name]
      )

      # render response
      response = ProjectTagBlueprint.render_as_hash(project_tag)

      # success
      Success(response)
    end
  end
end