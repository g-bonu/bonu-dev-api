# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Projects::CreateProjectOp do
  describe '#call' do
    let(:params) do
      {
        start_year: 2019,
        end_year: 2020,
        title: 'Test Project',
        organization: 'Test Organization',
        description: 'Test Description'
      }
    end

    before do
      allow(Projects::UpdateProjectImageOp).to receive(:call).and_return(Success())
      allow(Projects::UpdateProjectTagsOp).to receive(:call).and_return(Success())
    end

    subject { described_class.call(params:) }

    it 'creates a project' do
      expect(subject).to be_success
      expect(Project.count).to eq(1)
      expect(subject.value!).to eq ProjectBlueprint.render_as_hash(Project.first, view: :show)
    end

    it 'calls UpdateProjectImageOp and UpdateProjectTagsOp' do
      expect(Projects::UpdateProjectImageOp).to receive(:call)
      expect(Projects::UpdateProjectTagsOp).to receive(:call)
      subject
    end
  end
end
