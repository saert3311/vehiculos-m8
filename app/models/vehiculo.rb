class Vehiculo < ApplicationRecord
    validates :titulo, presence: true
    validates :descripcion, presence: true
    has_one_attached :img
end
