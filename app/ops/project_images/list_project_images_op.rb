module ProjectImages
  class ListProjectImagesOp < BaseOp
    def call(params:)
      # load project
      project = Project.find(params[:project_id])

      # load project images
      project_images = project.project_images

      # render project images
      response = ProjectImageBlueprint.render_as_hash(project_images)

      # success
      Success(response)
    end
  end
end