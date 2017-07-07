class Progress < ApplicationRecord
  belongs_to :project
  belongs_to :sprint

  validates_presence_of :completeness, :project_id, :sprint_id
end
