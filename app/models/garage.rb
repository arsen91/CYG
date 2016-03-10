class Garage < ActiveRecord::Base
    geocoded_by :address

    has_many :ratings
    has_many :comments
    # for seed
    # before_validation :geocode

    scope :search_query, lambda { |query|
      query = '' if query.blank?

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

    scope :average_cost, -> (average_cost) { where average_cost: Integer(average_cost) === 0 ? [1,2,3] : average_cost }

    def average_rating
      ratings.sum(:score) / ratings.size
    end
end
