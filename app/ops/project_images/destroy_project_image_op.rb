module ProjectImages
  class DestroyProjectImageOp < BaseOp
    def call(params:)
      # find project image
      project_image = ProjectImage.find(params[:id])

      # destroy project image
      project_image.destroy!

      # success
      Success()
    end
  end
end