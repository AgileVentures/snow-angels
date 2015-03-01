class Task < ActiveRecord::Base
  belongs_to :volunteer
  belongs_to :client
  has_and_belongs_to_many :match_task_volunteers

end
