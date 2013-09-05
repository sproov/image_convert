class ImagesController < ApplicationController

  respond_to :json

  def create
    @image = Image.new(params)
    if @image.save
      @image.process_images
      head :ok
    else
      render :json => { :errors => @image.errors.full_messages }
    end
  end

  def show
    render :text => 'show'
  end

  def index
    render :text => 'index'
  end



end
