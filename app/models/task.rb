class Task < ActiveRecord::Base
  has_many :volunteers, through: :match_task_volunteer
  belongs_to :client


  def geocoder_lat(post_code)
    location = Geocoder.search(post_code)
    location[0].latitude
  end

  def geocoder_long(post_code)
    location = Geocoder.search(post_code)
    location[0].longitude
  end

end
