require 'test_helper'

class ManageConnectionsTest < ActionDispatch::IntegrationTest
  test "link account and show linked account" do
    authenticate!
    visit me_path
    assert_equal [
                  "IG Aim",
                  "Connect discord profile",
                  "Connect windowslive profile"
                 ], all(".omniauth-providers li a").map(&:text)

    # prepare discord response
    OmniAuth.config.mock_auth[:discord] = OmniAuth::AuthHash.new(uid: "123456789",
      provider: "discord",
      info: {
        username: "IG Aim",
        discriminator: "7679",
      })

    click_on "Connect discord profile"

    assert_equal [
                  "IG Aim",
                  "IG Aim#7679",
                  "Connect windowslive profile"
                 ], all(".omniauth-providers li a").map(&:text)

  end
end
