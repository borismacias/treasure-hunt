require 'swagger_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'guesses', type: :request do
  path '/guesses' do
    let(:access_token) { 'access_token' }

    before do
      user = create(:user)
      user.update(access_token:)
    end

    post('create guess') do
      parameter name: 'access-token', in: :header, type: :string
      parameter name: 'body', in: :body, required: true, schema: {
        type: :object,
        required: %i[lat lng],
        properties: {
          lat: { type: :number },
          lng: { type: :number }
        }
      }

      response(200, 'successful') do
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
