class Car < ActiveRecord::Base
  belongs_to :user
  has_one :journal
end
