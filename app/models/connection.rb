# The connection represents the connection to another system
# which can be linked using omniauth (e.g. steam, discord)
class Connection < ApplicationRecord
  LINKS = {
    steam: -> (conn) { "https://steamcommunity.com/profiles/#{conn.uid}" },
    reddit: -> (conn) { "https://reddit.com/user/#{conn.name}" }
  }.with_indifferent_access

  belongs_to :user

  def link
    LINKS[provider]&.call(self)
  end
end
