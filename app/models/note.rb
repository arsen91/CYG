class Note < ActiveRecord::Base
  belongs_to :journal
  belongs_to :category
end
