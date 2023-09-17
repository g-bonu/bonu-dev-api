# frozen_string_literal: true

require 'swagger_helper'
require 'devise/jwt/test_helpers'

RSpec.describe 'Projects', type: %i[request acceptance] do
  path '/projects' do
    get 'Get a list of all projects' do
      produces 'application/json'

      let!(:projects) { create_list(:project, 3) }

      response '200', 'success' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   start_year: { type: :integer },
                   end_year: { type: :integer },
                   title: { type: :string },
                   organization: { type: :string },
                   description: { type: :string },
                   tags: {
                     type: :array,
                     items: {
                       type: :object,
                       properties: {
                         id: { type: :integer },
                         name: { type: :string }
                       }
                     }
                   }
                 }

               }

        run_test!
      end
    end
  end

  path '/projects/{id}' do
    get 'Get a project' do
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      let!(:project) { create(:project) }
      let(:id) { project.id }

      response '200', 'success' do
        schema type: :object,
               properties: {
                 start_year: { type: :integer },
                 end_year: { type: :integer },
                 title: { type: :string },
                 organization: { type: :string },
                 description: { type: :string },
                 tags: {
                   type: :array,
                   items: {
                     type: :object,
                     properties: {
                       id: { type: :integer },
                       name: { type: :string }
                     }
                   }
                 }
               }

        run_test!
      end
    end
  end
end
