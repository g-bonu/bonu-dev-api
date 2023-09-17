# frozen_string_literal: true

class ProjectBlueprint < Blueprinter::Base
  identifier :id

  fields :description,
          :end_year,
          :organization,
          :start_year,
          :title
end
