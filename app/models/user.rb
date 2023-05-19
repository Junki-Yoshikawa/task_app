class User < ApplicationRecord
  has_many :labels, dependent: :destroy
  has_many :tasks, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "is_admin", "is_delete", "modified_at", "name", "remember_created_at", "reset_password_sent_at", "reset_password_token"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["tasks"]
  end
end
