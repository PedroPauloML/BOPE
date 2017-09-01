class MacroActivity < ApplicationRecord

  # Associations
  belongs_to :project
  has_many :sub_macro_activities, dependent: :destroy

  # Validations
  validates_presence_of :description, :project_id
end
