class Week < ApplicationRecord
  belongs_to :sprint
  has_many :hours_registries, dependent: :destroy
  has_many :burndowns, dependent: :destroy
end
