require "test_helper"

class AdminManageGamesTest < ActionDispatch::IntegrationTest
  test "cannot access as non admin" do
    login_as(users(:donator_slayer))

    assert_raises ActionController::RoutingError do
      visit admin_games_path
    end
  end

  test "list games" do
    login_as(users(:admin_aim))
    visit root_path

    click_on "Manage games", visible: false # manage games link is placed in dropdown

    assert_equal(["Counter-Strike: Global Offensive",
                  "Rocket League"], games_table)
    assert_equal("2 in total", find("h1 small").text)
  end

  test "add new game" do
    login_as(users(:admin_aim))

    visit admin_games_path

    click_on "Add new game"

    attach_file "Image", fixture_file_path("pokemon.jpg")
    fill_in "Name", with: "Pokemon"

    assert_difference "Game.count", +1 do
      click_on "Create Game"
    end

    assert_equal(["Counter-Strike: Global Offensive",
                  "Pokemon",
                  "Rocket League"], games_table)
  end

  test "edit game" do
    login_as(users(:admin_aim))

    visit admin_games_path

    assert_equal(["Counter-Strike: Global Offensive",
                  "Rocket League"], games_table)

    click_on "Edit Rocket League"

    attach_file "Image", fixture_file_path("pokemon.jpg")
    fill_in "Name", with: "Pokemon"
    click_on "Update Game"

    assert_equal(["Counter-Strike: Global Offensive",
                  "Pokemon"], games_table)
  end

  test "destroy game" do
    login_as(users(:admin_aim))

    visit admin_games_path

    assert_difference "Game.count", -1 do
      click_on "Delete Rocket League"
    end

    assert_equal(["Counter-Strike: Global Offensive"], games_table)
  end

  private
  def games_table
    CornerStones::Table.new(".games").rows.map { |row| row["Name"] }
  end
end
