require 'sanitize'
class Album < ActiveRecord::Base
  belongs_to :user

  has_many :pictures, :dependent => :destroy
  accepts_nested_attributes_for :pictures, :reject_if => :all_blank, :allow_destroy => true
  has_friendly_id :name, :use_slug => true
  before_save :project_sanitization
  validates_presence_of :name
  validates :description, :presence => true

  def project_sanitization
    self.name = Sanitize.clean(self.name)
  end

end
