class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true

  belongs_to :agency
  has_many :products, through: :product_requests
  has_many :product_requests

  def name
    first_name + " " + last_name
  end
end
