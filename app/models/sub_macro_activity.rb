class SubMacroActivity < ApplicationRecord
  belongs_to :macro_activity

  validates_presence_of :description, :completeness, :macro_activity_id
end
