class Skill < ApplicationRecord
  enum level: [:bad, :halfbad, :fantastic]

  validates :name, presence: true
end
