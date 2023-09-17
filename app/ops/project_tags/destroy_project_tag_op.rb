module ProjectTags
  class DestroyProjectTagOp < BaseOp
    def call(params:)
      # find project tag
      project_tag = ProjectTag.find(params[:id])

      # destroy project tag
      project_tag.destroy!

      # success
      Success()
    end
  end
end