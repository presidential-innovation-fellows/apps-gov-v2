class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true

  belongs_to :agency
  has_many :messages
  has_many :products, through: :product_requests
  has_many :product_requests

  def name
    first_name + " " + last_name
  end

  def type_sym
    type.underscore.to_sym
  end
end
