# frozen_string_literal: true

namespace :admin do
  desc 'Prints the admin access token'
  task display_access_token: :environment do
    puts User.admin.first.access_token
  end
end
