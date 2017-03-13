require 'test_helper'

class ManageConnectionsTest < ActionDispatch::IntegrationTest
  test "link account and show linked account" do
    login_as(users(:admin_aim))
    visit me_path
    assert_omniauth_providers [
                               "IG Aim",
                               "Connect discord profile",
                               "Connect windowslive profile"
                              ]

    # prepare discord response
    OmniAuth.config.mock_auth[:discord] = OmniAuth::AuthHash.new(uid: "123456789",
      provider: "discord",
      info: {
        username: "IG Aim",
        discriminator: "7679",
      })

    click_on "Connect discord profile"

    assert_omniauth_providers [
                               "IG Aim",
                               "IG Aim#7679",
                               "Connect windowslive profile"
                              ]

  end

  private
  def assert_omniauth_providers(providers)
    assert_equal providers, all(".omniauth-providers li .btn-social").map(&:text)
  end
end
