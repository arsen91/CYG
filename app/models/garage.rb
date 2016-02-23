class Garage < ActiveRecord::Base
    geocoded_by :address
    after_validation :geocode

    has_one :working_time
end
