class Task < ActiveRecord::Base
  has_many :volunteers, through: :match_task_volunteer
  belongs_to :client
end
