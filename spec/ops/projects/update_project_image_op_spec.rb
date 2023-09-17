# frozen_string_literal: true

require 'rails_helper'

# Assuming you have already set up your RSpec environment

RSpec.describe Projects::UpdateProjectImageOp do
  let(:params) { { image: 'https://example.com/image.png' } }
  let(:project) { create(:project) }

  describe '#call' do
    subject { described_class.call(params:, project:) }

    context 'when params include an image' do
      it 'uploads the image to Cloudinary and updates the project image_url' do
        allow(Cloudinary::Uploader).to receive(:upload).and_return({ 'secure_url' => 'https://example.com/image.png' })
        expect(subject).to be_success
        expect(project.reload.image_url).to eq('https://example.com/image.png')
      end
    end

    context 'when params do not include an image' do
      it 'does not upload an image or update the project' do
        params[:image] = nil
        expect(subject).to be_success
        expect(project.reload.image_url).to be_nil
      end
    end
  end
end
