class Image < ActiveRecord::Base

  serialize :dimensions
  attr_accessible :external_id, :url, :producer_id, :dimensions
  has_attached_file :asset, styles: Proc.new { |asset| asset.instance.styles }

  scope :processed, where(processed: true)

  def self.by_external_id(external_id)
    where(external_id: external_id).first
  end

  def styles
    all_styles = {}
    dimensions.try(:each) do |d|
      all_styles[dimension_to_style(d).to_sym] = dimension_to_style(d)
    end
    all_styles
  end

  private
  def dimension_to_style(dimension)
    "#{dimension[:width]}x#{dimension[:height]}"
  end

end