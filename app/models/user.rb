class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :ratings
    has_many :comments

    def get_rating(garage_id)
        Rating.where(user_id: self.id, garage_id: garage_id)
    end
end
