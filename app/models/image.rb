class Image < ActiveRecord::Base

  has_attached_file :asset
  # before_save :extra


end