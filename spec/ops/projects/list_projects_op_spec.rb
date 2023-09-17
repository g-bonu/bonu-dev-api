# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Projects::ListProjectsOp do
  describe '#call' do
    let!(:project1) { create(:project) }
    let!(:project2) { create(:project) }

    subject { described_class.call }

    it 'lists all projects' do
      expect(subject).to be_success
      expect(subject.value!).to eq ProjectBlueprint.render_as_hash(Project.all, view: :index)
    end
  end
end
