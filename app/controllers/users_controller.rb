class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
  
      respond_to do |format|
        if @user.save 
            format.html { redirect_to '/', notice: 'User was successfully created.' }
            format.json { render :show, status: :created, location: @user }
        else
            format.html { render :new }
            format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      format.html { redirect_to '/', notice: 'User was successfully updated.' }
      format.json { render :show, status: :ok, location: @user }
    else
      format.html { render :edit }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /users/1
  def destroy
    begin
      @user.destroy
      flash[:notice] = "User #{@user.name} deleted"
    rescue Exception => e
        flash[:notice] = e.message
    end
    respond_to do |format|
        format.html { redirect_to users_url }
        format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :hashed_password, :salt, :password, :password_confirmation)
    end
end
