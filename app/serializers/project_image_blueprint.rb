class ProjectImageBlueprint < Blueprinter::Base
  identifier :id

  fields :image_url, :thumbnail_url
end