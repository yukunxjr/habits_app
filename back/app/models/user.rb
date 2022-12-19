# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable ,:validatable
  include DeviseTokenAuth::Concerns::User

  has_many :notes, dependent: :destroy
  has_many :plans, dependent: :destroy
  has_many :skills, dependent: :destroy

  validates :name, presence: true
end
