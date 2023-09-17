class ProjectImage < ApplicationRecord
  belongs_to :project

  validates :image_url, presence: true
end

# == Schema Information
#
# Table name: project_images
#
#  id            :bigint           not null, primary key
#  image_url     :string           not null
#  thumbnail_url :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  project_id    :bigint           not null
#  public_id     :string           not null
#
# Indexes
#
#  index_project_images_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
