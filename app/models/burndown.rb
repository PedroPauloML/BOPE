class Burndown < ApplicationRecord
  belongs_to :project
  belongs_to :week

  validates_presence_of :points_made, :project_id, :week_id
end
