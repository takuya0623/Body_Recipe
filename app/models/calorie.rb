class Calorie < ApplicationRecord

    validates :name, presence: true
    validates :calorie, numericality: {only_integer: true}
    validates :weight, numericality: {only_integer: true}
    validates :is_active, inclusion: {in: [true, false]}
    validates :yomi, presence: true

    def self.search(search)
      if search
        Calorie.where(['name LIKE ?', "%#{search}%"])
      else
        Calorie.all
      end
    end

end


