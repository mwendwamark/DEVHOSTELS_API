class ItemsController < ApplicationController
    def create
      image = Cloudinary::Uploader.upload(params[:image])
      item = Item.create(image: image['url'])
      
      render json: {
        status: 200,
        item: item
      }
    end

    def index
      images= Item.all
      render json: images
    end
  end