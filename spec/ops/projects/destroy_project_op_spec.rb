# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Projects::DestroyProjectOp do
  describe '#call' do
    let!(:project) { create(:project) }
    let(:project_id) { project.id }
    let!(:project_tag1) { create(:project_tag, project:, name: 'tag1') }
    let!(:project_tag2) { create(:project_tag, project:, name: 'tag2') }

    subject { described_class.call(project_id:) }

    it 'destroys the project' do
      expect { subject }.to change { Project.count }.from(1).to(0)
    end

    it 'destroys the project tags' do
      expect { subject }.to change { ProjectTag.count }.from(2).to(0)
    end

    it 'returns a success' do
      expect(subject).to be_success
    end
  end
end
