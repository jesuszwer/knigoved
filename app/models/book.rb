class Book < ApplicationRecord
  #TODO Проверка валедации
  validates :title, presence: true
  validates :genre, presence: true
  validates :author, presence: true
end
