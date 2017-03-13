class Role < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_and_belongs_to_many :users

  class << self
    def admin
      @admin ||= find_by!(name: :admin)
    end
  end
end
