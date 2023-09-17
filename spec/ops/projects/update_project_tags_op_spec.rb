# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Projects::UpdateProjectTagsOp do
  describe '#call' do
    let!(:project) { create(:project) }
    let!(:project_tag1) { create(:project_tag, project:, name: 'tag1') }
    let!(:project_tag2) { create(:project_tag, project:, name: 'tag2') }
    let!(:params) { { tags: %w[tag3 tag4 tag5] } }

    subject { described_class.call(params:, project:) }

    it 'deletes all existing tags and creates new tags' do
      expect { subject }.to change { project.project_tags.count }.from(2).to(3)
    end

    it 'creates the correct tags' do
      subject
      expect(project.project_tags.pluck(:name)).to match_array(%w[tag3 tag4 tag5])
    end

    it 'returns a success' do
      expect(subject).to be_success
    end
  end
end
