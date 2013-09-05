class Image < ActiveRecord::Base

  has_attached_file :asset, styles: Proc.new { |asset| asset.instance.styles }
  has_attached_file :asset
  before_save :parse_dimensions
  # before_save :extract_dimensions
  # serialize :dimensions


  def styles
    self.dimensions
  end

  def image?
    asset_content_type =~ %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|pjpeg|png|x-png)$}
  end

  def parse_dimensions
    binding.pry
  end

end