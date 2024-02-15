# frozen_string_literal: true

require 'swagger_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'users', type: :request do
  path '/users' do
    let(:access_token) { 'access_token' }

    before do
      user = create(:user)
      user.update(access_token:)
    end

    post('create user') do
      parameter name: 'access-token', in: :header, type: :string
      parameter name: 'body', in: :body, required: true, schema: {
        type: :object,
        required: %i[email name],
        properties: {
          email: { type: :string },
          name: { type: :string }
        }
      }

      response(201, 'created') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response '401', 'unauthorized' do
        let(:access_token) { nil }
        run_test!
      end

      response '422', 'invalid request' do
        let(:'body[email]') { nil }
        run_test!
      end
    end
  end

  path '/users/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show user') do
      parameter name: 'access-token', in: :header, type: :string

      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/winners' do
    get('show winners') do
      response(200, 'successful') do
        parameter name: 'access-token', in: :header, type: :string

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength