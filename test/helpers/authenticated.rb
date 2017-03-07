# Will log in the user "aim" (see in /test/fixtures/users.yml)
module Authenticated
  extend ActiveSupport::Concern

  included do
    setup do
      OmniAuth.config.mock_auth[:reddit] =
        OmniAuth::AuthHash.new(uid: "wwkxo",
                               provider: "reddit",
                               info: {
                                 name: "Elektron1c97",
                               })
      visit user_reddit_omniauth_authorize_path
    end
  end
end
