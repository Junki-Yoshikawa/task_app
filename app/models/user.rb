class User < ApplicationRecord
  has_many :labels, dependent: :destroy
  has_many :tasks, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def self.ransackable_attributes(auth_object = nil)
    ["email", "name"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["tasks"]
  end
end
