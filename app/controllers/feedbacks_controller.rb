class FeedbacksController < ApplicationController
	def index
	  @feedback = Feedback.all
	end

	 def new
    #binding.pry
    @feedback = current_user.feedbacks.new
  end

  def create
     #binding.pry
    @feedback = current_user.feedbacks.new(feedback_params)
       if @feedback.save
      redirect_to user_feedbacks_path(current_user), :notice => "Feedback has been created successfully!"
     else
      render 'new'
     end
  end
	
	def show
	  @feedback = Feedback.find(params[:id])
	end

	def edit
	  @feedback = Feedback.find(params[:id])
    end

	def update
	   @feedback = Feedback.find(params[:id])
          if @feedback.update_attributes(feedback_params)
      	    redirect_to user_feedbacks_path(current_user)
          else
      	    render 'edit'
         end
	end

	def destroy
       @feedback = Feedback.find(params[:id])
       @feedback.destroy
       redirect_to user_feedback_path, notice: "User deleted."
    end

  private
    
    def feedback_params
      params.require(:feedback).permit(:user_id,:feedback, :punctuality, :communication, :behavior, :meet_to_deadline, :daily_reporting, :problem_solving, :research_capabilities, :self_motivated, :understanding_of_tasks, :working_in_a_team, :overall_rating, :remark,:client_project_detail_id)
    end
end
