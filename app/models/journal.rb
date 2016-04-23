class Journal < ActiveRecord::Base
  belongs_to :car
  has_many :notes
end
