class Register < ApplicationRecord
    validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only accept letters!" }, length: { minimum: 2 }

  validates :surname, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only accept letters!" }, length: { minimum: 2 }

  validates :number, presence: true, length: { is: 9 }

  def self.search(query)
	where("name like ?", "%#{query}%")
  end

end
