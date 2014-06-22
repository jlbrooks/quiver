class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name

  has_many :comments
  has_many :posts

  has_and_belongs_to_many :groups

  def name
    first_name + " " + last_name
  end

end
