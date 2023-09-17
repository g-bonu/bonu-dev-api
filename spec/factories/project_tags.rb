# frozen_string_literal: true

FactoryBot.define do
  factory :project_tag do
    project
    name { Faker::Lorem.word }
  end
end

# == Schema Information
#
# Table name: project_tags
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#
# Indexes
#
#  index_project_tags_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
