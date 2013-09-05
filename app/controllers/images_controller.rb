class ImagesController < ApplicationController

  respond_to :json

  def create
    @image = Image.new(params)

    head :ok
  end

  def show
    render :text => 'show'
  end

  def index
    render :text => 'index'
  end



end
