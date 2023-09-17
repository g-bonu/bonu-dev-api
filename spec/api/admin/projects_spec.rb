# frozen_string_literal: true

require 'swagger_helper'
require 'devise/jwt/test_helpers'

RSpec.describe 'Admin Projects', type: %i[request acceptance] do
  let!(:admin) { create(:admin) }

  path '/admin/projects' do
    get 'Get a list of all projects' do
      produces 'application/json'
      security [bearerAuth: []]

      let!(:projects) { create_list(:project, 3) }
      let!(:Authorization) { get_jwt(admin) }

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

      response '401', 'unauthorized' do
        let!(:Authorization) { 'Bearer potato' }

        run_test!
      end
    end

    post 'Create a project' do
      produces 'application/json'
      consumes 'application/json'
      security [bearerAuth: []]

      parameter name: :project, in: :body, schema: {
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
                tag: { type: :string }
              }
            }
          }
        }
      }

      let!(:Authorization) { get_jwt(admin) }
      let(:project) do
        {
          start_year: 2020,
          end_year: 2021,
          title: 'Project Title',
          organization: 'Organization',
          description: 'Description',
          tags: [
            { tag: 'tag1' },
            { tag: 'tag2' }
          ]
        }
      end

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

      response '401', 'unauthorized' do
        let!(:Authorization) { 'Bearer potato' }

        run_test!
      end
    end
  end

  path '/admin/projects/{id}' do
    get 'Get a project' do
      produces 'application/json'
      security [bearerAuth: []]

      parameter name: :id, in: :path, type: :integer

      let!(:Authorization) { get_jwt(admin) }
      let!(:existing_project) { create(:project) }
      let(:id) { existing_project.id }

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

      response '401', 'unauthorized' do
        let!(:Authorization) { 'Bearer potato' }

        run_test!
      end
    end

    put 'Update a project' do
      produces 'application/json'
      consumes 'application/json'
      security [bearerAuth: []]

      parameter name: :id, in: :path, type: :integer
      parameter name: :project, in: :body, schema: {
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
                tag: { type: :string }
              }
            }
          }
        }
      }

      let!(:Authorization) { get_jwt(admin) }
      let!(:existing_project) { create(:project) }
      let(:id) { existing_project.id }
      let(:project) do
        {
          start_year: 2020,
          end_year: 2021,
          title: 'Project Title',
          organization: 'Organization',
          description: 'Description',
          tags: [
            { tag: 'tag1' },
            { tag: 'tag2' }
          ]
        }
      end

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

      response '401', 'unauthorized' do
        let!(:Authorization) { 'Bearer potato' }

        run_test!
      end
    end
  end
end
