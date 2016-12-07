class User < ApplicationRecord
  has_secure_password
  has_one :profile, dependent: :destroy

  accepts_nested_attributes_for :profile, reject_if: :all_blank

  def generate_token
    begin
      self[:auth_token] = SecureRandom.urlsafe_base64
    end while User.exists?(:auth_token => self[:auth_token])
  end

  def regenerate_auth_token
    self.auth_token = nil
    generate_token
    save!
  end

end
