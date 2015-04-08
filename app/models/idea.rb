class Idea < ActiveRecord::Base
  validates :idea_description, :idea_benefit, :email, :supervisor_email, :presence=>true
  validates_format_of :email, :with => /@/
  validates_format_of :supervisor_email, :with => /@/
  enum idea_status: [:Open, :Implemented, :Rejected]
  enum priority: [:Low, :Medium, :High]
end
