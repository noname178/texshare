class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :shared_posts, class_name: 'Posts', foreign_key: 'owner_id'
   has_many :received_posts, class_name: 'Posts', foreign_key: 'receiver_id'
   has_many :messages
end
