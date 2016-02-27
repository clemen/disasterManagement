class UserInfo < ActiveRecord::Base
	

	attr_accessible :id, :username, :email, :firstname, :lastname, :phone, :profession, 
	:streetnumber, :streetline1, :streeline2, :zipcode, :state, :city, :country, :password_hash, :salt
	validates_presence_of :username, :email, :password_hash, :firstname, :lastname, :salt

	def self.create_with_password(params)
		salt = SecureRandom.hex
		password_hash = self.create_password_hash(params[:password], salt)

		self.create(
			username: params[:username],
			email: params[:email],
			firstname: params[:firstname],
			lastname:params[:lastname],
			salt: salt,
			password_hash: password_hash,
			phone: params[:phone],
			streetnumber: params[:streetnumber],
			streetline1: params[:streetline1],
			streeline2: params[:streeline2],
			zipcode: params[:zipcode],
			state: params[:state],
			city: params[:city],
			country: params[:country]
			)

	end

	def self.create_password_hash(password, salt) 
		digest = OpenSSL::Digest::SHA256.new
		digest.update(password)
		digest.update(salt)
		password_hash = digest.to_s
	end

	def verify_password(password)
		UserInfo.create_password_hash(password, self.salt) == self.password_hash
	end


end
