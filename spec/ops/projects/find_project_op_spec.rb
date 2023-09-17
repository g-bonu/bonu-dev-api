# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Projects::FindProjectOp do
  describe '#call' do
    let(:project) { create(:project) }

    subject { described_class.call(project_id: project.id) }

    it 'finds a project' do
      expect(subject).to be_success
      expect(subject.value!).to eq ProjectBlueprint.render_as_hash(project, view: :show)
    end
  end
end
