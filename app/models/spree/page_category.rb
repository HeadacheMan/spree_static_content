class Spree::PageCategory < ActiveRecord::Base

  has_many :pages

  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug

  scope :visible, -> {where(visible: true)}

end