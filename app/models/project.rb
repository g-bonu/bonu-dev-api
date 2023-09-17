# frozen_string_literal: true

class Project < ApplicationRecord
  validates :start_year, presence: true
  validates :title, presence: true
  validates :organization, presence: true
  validates :description, presence: true

  has_many :project_tags, dependent: :destroy
  has_many :project_images, dependent: :destroy
end

# == Schema Information
#
# Table name: projects
#
#  id           :bigint           not null, primary key
#  description  :string           not null
#  end_year     :integer
#  organization :string           not null
#  start_year   :integer          not null
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
