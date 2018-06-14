class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, if: -> { authenticated_with_token? && action_name == "index" }
  before_action :set_order, only: [:show, :edit, :update]
  before_action :today_menu, only: [:new, :show, :edit, :create]
  before_action :require_permission, only: [:show]
  before_action :restrict_edit_previous_orders, only: [:edit]


  # GET /orders
  # GET /orders.json
  def index
    if request.path_parameters[:format] == 'json'
      if authenticated_with_token?
        @orders = Order.all_orders.where(created_at: DateTime.now.beginning_of_day..DateTime.now)
      end
    else
      if current_user.admin?
        @orders = Order.all_orders
      else
        @orders = Order.all_orders.where(user: current_user)
      end
    end


  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit

  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def restrict_edit_previous_orders
      unless Date.today.strftime("%d.%m.%Y") == @order.created_at.strftime("%d.%m.%Y")
        raise ActiveRecord::RecordNotFound
      end
    end

    def authenticated_with_token?
      if params[:access_token] && params[:access_token].length > 0
        user = User.find_by(access_token: params[:access_token])
        if user
          true
        else
          false
        end
      else
        false
      end
    end

    def today_menu
      @today_menu = Menu.eager_load(:foods).today_menu.first
    end

    def require_permission
      unless current_user.admin? || current_user == Order.find(params[:id]).user
        raise ActiveRecord::RecordNotFound
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :first_course_id, :main_course_id, :drink_id)
    end
end
