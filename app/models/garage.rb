class Garage < ActiveRecord::Base
    geocoded_by :address
    after_validation :geocode
2end
