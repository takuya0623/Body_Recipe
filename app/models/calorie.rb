class Calorie < ApplicationRecord

    validates :name, presence: true
    validates :calorie, numericality: {only_integer: true}
    validates :weight, numericality: {only_integer: true}
    validates :is_active, inclusion: {in: [true, false]}

end


