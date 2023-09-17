# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Projects::UpdateProjectOp do
  describe '#call' do
    let(:project) { create(:project) }
    let(:params) do
      {
        start_year: 2022,
        end_year: 2023,
        title: 'Updated Project Title',
        organization: 'Updated Organization',
        description: 'Updated Description'
      }
    end

    before do
      allow(Projects::UpdateProjectImageOp).to receive(:call).and_return(Success())
      allow(Projects::UpdateProjectTagsOp).to receive(:call).and_return(Success())
    end

    subject { described_class.call(params:, project_id: project.id) }

    it 'updates the project and returns a success response' do
      expect(subject).to be_success
      expect(subject.value!).to eq ProjectBlueprint.render_as_hash(project.reload, view: :show)
      project.reload
      expect(project.start_year).to eq(2022)
      expect(project.end_year).to eq(2023)
      expect(project.title).to eq('Updated Project Title')
      expect(project.organization).to eq('Updated Organization')
      expect(project.description).to eq('Updated Description')
    end

    it 'calls Projects::UpdateProjectImageOp and Projects::UpdateProjectTagsOp' do
      expect(Projects::UpdateProjectImageOp).to receive(:call).with(params:, project:)
      expect(Projects::UpdateProjectTagsOp).to receive(:call).with(params:, project:)
      subject
    end
  end
end
