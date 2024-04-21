class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  accepts_nested_attributes_for :customer

  enum role: [:customer, :admin, :employee]
  has_one :customer
  has_one :employee
  has_one :admin
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :customer
  end
end
