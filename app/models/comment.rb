class Comment < ActiveRecord::Base
  belongs_to :garage
  belongs_to :user

  def get_user
    User.find(self.user_id)
  end
end
