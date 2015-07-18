class Job < ActiveRecord::Base

  has_many :job_applicants
  geocoded_by :address, :latitude  => :job_latitude, :longitude => :job_longitude

  def address
    [street, city, state].compact.join(', ')
  end

end
