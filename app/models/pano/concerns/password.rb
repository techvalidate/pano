module Pano
  module Password
    extend ActiveSupport::Concern

    attr_accessor :password

    included do
      before_save :encrypt_password

      validates :password, if: :password,
        confirmation: true,
        length: { in: 8..40 },
        format: { with: /\d/, message: 'requires at least one number' }
      validates :password_confirmation, presence: true, if: :password
    end

    def encrypt_password(cost: 12)
      self.password_digest = BCrypt::Password.create(@password, cost: cost) if password
    end

    def authenticate(unencrypted_password)
      return false if unencrypted_password.nil? || password_digest.nil?
      BCrypt::Password.new(password_digest) == unencrypted_password && self
    end

    def set_reset_token
      update_attributes password_reset_token: SecureRandom.hex, password_reset_at: Time.zone.now
    end

    def clear_reset_token
      update_attributes password_reset_token: nil, password_reset_at: nil
    end

  end
end
