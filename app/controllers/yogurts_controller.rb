class YogurtsController < ApplicationController
  before_action :set_yogurt, :only => [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @yogurts = Yogurt.all

    respond_with @yogurts
  end

  def show
    respond_with @yogurt
  end

  def edit
  end

  def new
    @yogurt = Yogurt.new
  end

  def create
    @yogurt = Yogurt.new(yogurt_params)

    if @yogurt.save
      respond_to do |format|
        format.html { redirect_to yogurts_path }
        format.json { render json: @yogurt, status: :created}
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json { render json: @yogurt.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    if @yogurt.update(yogurt_params)
      respond_to do |format|
        format.html { redirect_to yogurts_path }
        format.json { render nothing: true, status: :no_content }
      end
    else
      respond_to do |format|
        format.html { render 'edit' }
        format.json { render json: @yogurt.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @yogurt.destroy
    respond_to do |format|
      format.html { redirect_to yogurts_path }
      format.json { render json: :no_content }
    end
  end

  protected

  def set_yogurt
    @yogurt = Yogurt.find(params[:id])
  end

  def yogurt_params
    params.require(:yogurt).permit(:flavor, :topping, :quantity)
  end

end