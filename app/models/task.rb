class Task < ActiveRecord::Base
  belongs_to :volunteer
  belongs_to :client

end
