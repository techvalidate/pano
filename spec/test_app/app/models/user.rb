class User < ApplicationRecord
  validates :email, uniqueness: { case_sensitive: false }, :'pano/email' => true
end