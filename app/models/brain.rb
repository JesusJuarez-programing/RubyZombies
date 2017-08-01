class Brain < ApplicationRecord
    belongs_to :zombie
    
    validates :flavor, presence: true
    validates :iq, numericality: {only_integer: true, message: "Sólo números!!"}
end
