class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  def index
    @carts = []
    if session[:cart_id] != nil
      @carts << Cart.find_by_id(session[:cart_id])
    end
  end

  # GET /carts/1
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      redirect_to @cart, notice: 'Cart was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(cart_params)
      redirect_to @cart, notice: 'Cart was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /carts/1
  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Cart was successfully destroyed'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cart_params
      params[:cart]
    end
end
