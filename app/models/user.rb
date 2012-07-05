class User < ActiveRecord::Base
	has_and_belongs_to_many :departments
	acts_as_authentic
	attr_accessible :admin_level, :name, :password_confirmation, :login, :password
end
