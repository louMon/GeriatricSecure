class SignosVital < ApplicationRecord
  belongs_to :registro_consultum, optional: true
end
