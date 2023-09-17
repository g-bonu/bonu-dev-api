# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    start_year { Faker::Number.between(from: 2000, to: 2018) }
    end_year { Faker::Number.between(from: 2018, to: 2023) }
    title { Faker::Lorem.sentence }
    organization { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
  end
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
