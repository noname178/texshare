class Post < ActiveRecord::Base
  extend Enumerize

  enumerize :status, in: {new: 'new', old: 'old', written: 'written'}
  enumerize :under, in: {lit: 'lit', edu: 'edu', eco: 'eco', law: 'law', man: 'man', sip: 'sip', mal: 'mal', sci: 'sci', inf: 'inf', ear: 'ear', sta: 'sta' }

  mount_uploader :image, ImageUploader

  validates_presence_of :title, :status , :image
end
