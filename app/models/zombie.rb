class Zombie < ApplicationRecord
    has_many :brains
    validates :bio, presence: true
    validates :bio, length: {maximum: 100}
    validates :name, presence: true
    validates :age, numericality: {only_integer: true, message: "Sólo números!!"}
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
    validates :rotten, presence: true
    mount_uploader :avatar, AvatarUploader
    belongs_to :admin
end
