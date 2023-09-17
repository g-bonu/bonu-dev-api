module ProjectTags
  class ListProjectTagsOp < BaseOp
    def call(params:)
      # load project
      project = Project.find(params[:project_id])

      # load project tags
      project_tags = project.project_tags

      # render project tags
      response = ProjectTagBlueprint.render_as_hash(project_tags)

      # success
      Success(response)
    end
  end
end