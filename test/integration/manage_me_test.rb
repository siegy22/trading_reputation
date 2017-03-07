# -*- coding: utf-8 -*-
require 'test_helper'

class ManageMeTest < ActionDispatch::IntegrationTest
  test "Register with reddit" do
    reddit_name = "TheDude"
    OmniAuth.config.mock_auth[:reddit] = OmniAuth::AuthHash.new(uid: "someuid",
                                                                provider: 'reddit',
                                                                info: {
                                                                  name: reddit_name,
                                                                })

    visit root_path

    assert_difference "User.count", +1 do
      click_on "Sign in with reddit"
    end

    assert_flash "Nice to have you here! You can now complete your profile", type: "info"
    assert_equal "TheDude", find("#user_name").value

    custom_name = "I am the Dude"

    attach_file "Avatar", fixture_file_path("profile_picture.jpg")
    fill_in "Name", with: custom_name
    fill_in "Old reputation comment", with: "https://www.reddit.com/r/RocketLeagueExchange/comments/52k9le/meta_successful_tradereputation_thread/d7m1i9f/"

    click_on "Save"

    assert_equal "#{custom_name} /u/#{reddit_name}", find("h1").text
  end

  test "Logging in with reddit (user already exists)" do
    OmniAuth.config.mock_auth[:reddit] = OmniAuth::AuthHash.new(uid: "wwkxo",
                                                                provider: 'reddit',
                                                                info: {
                                                                  name: "Elektron1c97",
                                                                })

    assert_no_difference "User.count" do
      visit user_reddit_omniauth_authorize_path
    end

    assert_flash "You've been logged in, welcome back!", type: "info"
  end
end
