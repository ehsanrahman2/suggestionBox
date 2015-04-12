class IdeasController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  before_action :all_ideas, only: [:index, :create, :destroy, :update]
  before_filter :authorize
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :set_priorities
  before_action :set_idea_statuses
  
  respond_to :html, :js
  
  # GET /ideas
  # GET /ideas.json
  def index
    # @ideas = Idea.all   
    @ideas = Idea.where("email = ? OR supervisor_email = ?", session[:email], session[:email])
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
  end
  
  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)
	@idea.save!
	@current_idea = @idea
	@ideas = Idea.where("email = ? OR supervisor_email = ?", session[:email], session[:email]) 
	# Send email
	UserMailer.send_email(@idea).deliver
  end

  def update
    @idea.update!(idea_params)
    @current_idea = @idea
	@ideas = Idea.where("email = ? OR supervisor_email = ?", session[:email], session[:email])
	# Send email
	UserMailer.send_email(@idea).deliver

  end

  def destroy
    @idea.destroy!
    @current_idea = @idea
	@ideas = Idea.where("email = ? OR supervisor_email = ?", session[:email], session[:email])
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

	def set_priorities
		@priorities = Idea.priorities
	end

	def set_idea_statuses
		@idea_statuses = Idea.idea_statuses
	end	 
	
    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:idea_description, :idea_benefit, :priority, :idea_status, :email, :supervisor_email)
    end
    
    def idea_emails
      params.require(:idea).permit(:email)
    end
    
    def all_ideas
      @ideas = Idea.all
    end	
end
