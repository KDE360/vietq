class UsersController < ApplicationController
	def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    	if user.save
    		redirect_to new_session_path
    			#redirect_to :action => :index
    	else
        redirect_to new_user_path
    		#render 'new'
    	end
  end
  
  def show
  	@user = User.new
    
  end
  def edit
		@user = User.find(params[:id])
	end
 def update
		@user = User.find(params[:id])
		if @bean.update_attributes(params.require(:user).permit(:name, :email, :password))
			redirect_to users_path
		else
			render 'edit'
		end
	end
  def destroy
     User.find(params[:id]).destroy
    # Exactly the same idea as this little number:
		# User.find_by(id: params[:id])
    redirect_to users_path
  end
end
