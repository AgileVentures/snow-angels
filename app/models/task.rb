class Task < ActiveRecord::Base
  belongs_to :volunteer
  belongs_to :client

  def match_with_volunteer(client)
    client
  end

end
