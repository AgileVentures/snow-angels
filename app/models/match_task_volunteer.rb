class MatchTaskVolunteer < ActiveRecord::Base

  has_and_belongs_to_many :volunteers
  has_and_belongs_to_many :tasks
end
