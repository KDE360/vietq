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
    		redirect_to users_path
    	else
    		render 'new'
    	end
  end
  
  def show
    
  end
  def edit
    
  end
  def update
    
  end
  def destroy
     User.find(params[:id]).destroy
    # Exactly the same idea as this little number:
		# User.find_by(id: params[:id])
    redirect_to users_path
  end
end
