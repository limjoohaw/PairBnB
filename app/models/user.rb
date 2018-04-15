# class User < ApplicationRecord
# end
class User < ApplicationRecord
  include Clearance::User
 has_many :authentications, dependent: :destroy
 has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
 has_many :listings
 has_many :reservations
 has_many :booked_listings, through: :reservations, source: :listing

 def self.create_with_auth_and_hash(authentication, auth_hash)
   user = self.create!(
     # name: auth_hash["name"],
     email: auth_hash["extra"]["raw_info"]["email"],
     password: SecureRandom.hex(10)
   )
   user.authentications << authentication
   return user
 end

 # grab fb_token to access Facebook for user data
 def fb_token
   x = self.authentications.find_by(provider: 'facebook')
   return x.token unless x.nil?
 end

 def admin?
    self.role == "admin"
 end
 
end
