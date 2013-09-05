class Image < ActiveRecord::Base

  has_attached_file :asset, styles: Proc.new { |asset| asset.instance.styles }
  serialize :dimensions

  scope :processed, where(processed: true)

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