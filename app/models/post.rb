class Post < ActiveRecord::Base
  extend Enumerize

  enumerize :status, in: {new: 'new', old: 'old', written: 'written'}
  enumerize :under, in: {lit: 'lit', edu: 'edu', eco: 'eco', law: 'law', man: 'man', sip: 'sip', mal: 'mal', sci: 'sci', inf: 'inf', ear: 'ear', sta: 'sta' }

  mount_uploader :image, ImageUploader

  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  has_many :messages

  validates_presence_of :title, :status , :image
end
