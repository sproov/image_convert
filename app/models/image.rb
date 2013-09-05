class Image < ActiveRecord::Base
  require 'open-uri'

  serialize :dimensions
  attr_accessible :external_id, :url, :producer_id, :dimensions
  has_attached_file :asset, styles: Proc.new { |asset| asset.instance.styles }

  scope :processed, where(processed: true)

  validates :external_id, presence: true, numericality: true, uniqueness: true
  validates :producer_id, presence: true, numericality: true
  validates :url, presence: true
  #TODO validate format of url

  def self.by_external_id(external_id)
    where(external_id: external_id).first
  end

  def self.process_images_by_id(id)
    images = Image.where(id: id)
    images.map(&:process_images)
  end

  def styles
    all_styles = {}
    dimensions.try(:each) do |d|
      all_styles[dimension_to_style(d).to_sym] = dimension_to_style(d)
    end
    all_styles
  end

  def process_images
    asset = open(url)
    asset.reprocess!
    processed = true
    save
  end

  private
  def dimension_to_style(dimension)
    "#{dimension[:width]}x#{dimension[:height]}"
  end

end