 class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end
  def new
    @photo =Photo.new
  end
  def create
    # Find our parent decision that we should attach to
    @photo = current_user.photos.new(photo_params)
    #@photo.date ||= DateTime.now
    # @tags = tagger(tags)
    #@photo.tags = tagger(@photo.tags)
    # Attach this criterion to a decision
    if @photo.save
      flash[:notice] = 'Photo was successfully created.'
      redirect_to user_path(current_user) 
    else
      render 'new'
    end
  end

 def update
    @photo = photo.find(params[:id])
    if @user.update
      redirect_to users_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to user_path(current_user)
    
  end

  private
  def photo_params
    params.require(:photo).permit(:image)
  end
end