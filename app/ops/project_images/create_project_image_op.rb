module ProjectImages
  class CreateProjectImageOp < BaseOp
    def call(params:)
      # load project
      project = Project.find(params[:project_id])

      # upload the project image to Cloudinary
      cloudinary_response = Cloudinary::Uploader.upload(params[:image])

      # create project image
      project_image = project.project_images.create!(
        image_url: cloudinary_response['secure_url'],
        public_id: cloudinary_response['public_id'],
        thumbnail_url: Cloudinary::Utils.cloudinary_url(cloudinary_response['public_id'], width: 200, height: 113, crop: :fill)
      )

      # render project image
      response = ProjectImageBlueprint.render_as_hash(project_image)

      # success
      Success(response)
    end
  end
end