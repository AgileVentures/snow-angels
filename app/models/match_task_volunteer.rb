class MatchTaskVolunteer < ActiveRecord::Base
  belongs_to :volunteers
  belongs_to :tasks

end
