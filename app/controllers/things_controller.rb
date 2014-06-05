class ThingsController < ApplicationController
  before_action :set_thing, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:edit, :destroy]
  before_action :authenticate_user!


  def index
    @things = Thing.all.paginate(page: params[:page], per_page: 6)
  end

  def show 
  end

  def my_things
    @things = current_user.things.all.paginate(page: params[:page], per_page: 6)

  end

  def new
    @thing = Thing.new
  end

  def edit

end

  def create
    @thing = Thing.new(thing_params)
    @thing.user_id = current_user.id

    respond_to do |format|
      if @thing.save
        format.html { redirect_to @thing, notice: 'Thing was successfully created.' }
        format.json { render :show, status: :created, location: @thing }
      else
        format.html { render :new }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @thing.update(thing_params)
        format.html { redirect_to @thing, notice: 'Thing was successfully updated.' }
        format.json { render :show, status: :ok, location: @thing }
      else
        format.html { render :edit }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @thing.destroy
    redirect_to things_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thing
      @thing = Thing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thing_params
      params.require(:thing).permit(:name, :description, :user_id)
    end

    def authorize
      
        if current_user.id == @thing.user_id
          flash[:notice] = "created"
        else
          flash[:danger] = "ERROR! This is not yours to mess with.."
          redirect_to things_path
        end
    end
end
