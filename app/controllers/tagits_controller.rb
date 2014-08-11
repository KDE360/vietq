class TagitsController < ApplicationController

def index
  	@tagit = Tagit.all
  end

  def new
  	@tagit= Tagit.new
  end

  def create
  	tagit = Tagit.new(
  		params.require(:tagit).permit(:text, :user_id)
  		)
  	if tagit.save
	  	redirect_to tagit_path
  	end
  end

  def destroy
  	Tagit.find(params[:id]).destroy
  	redirect_to decisions_path
  end
end
