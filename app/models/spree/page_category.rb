class Spree::PageCategory < ActiveRecord::Base

  has_many :pages

  validates :name, presence: true, uniqueness: true

  scope :visible, -> {where(visible: true)}

end