class User < ActiveRecord::Base

    has_secure_password

    validates :password, presence: true
    validates :password_confirmation, presence: true
    validates :password_digest, presence: true
    #validates :email, uniqueness: true, presence: true
    validates :email, uniqueness: { case_sensitive: false }, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, length: { minimum: 8}
    

    def self.authenticate_with_credentials(email, password)
      email = email.strip.downcase
      self.find_by(email: email).try(:authenticate, password)
    end
    
end
