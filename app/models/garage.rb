require 'pry'
class Garage < ActiveRecord::Base
    geocoded_by :address
    # for seed
    # before_validation :geocode

    scope :search_query, lambda { |query|
      return nil  if query.blank?

      terms = query.downcase.split(/\s+/)

      terms = terms.map { |e|
        ('%' + e.gsub('*', '%') + '%').gsub(/%+/, '%')
      }

      num_or_conds = 2

      where(
        terms.map { |term|
          "(LOWER(garages.name) LIKE LOWER(?) OR LOWER(garages.address) LIKE LOWER(?))"
        }.join(' AND '),
        *terms.map { |e| [e] * num_or_conds }.flatten
      )
    }
end
