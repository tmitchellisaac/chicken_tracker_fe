class MeetingsController < ApplicationController
  def index
    if params[:user_id]
      @facade = MeetingsFacade.new(params)
      @events = @facade.user_meetings
    else
      redirect_to users_path
    end
  end

  def show
    @meeting = SingleDayEvent.find(params[:id])
    @facade = MeetingsFacade.new(params)
  end

  def new
    if params[:user_id]
    @facade = MeetingsFacade.new(params)
    else
      redirect_to user_path(current_user)
    end
  end

  def create
    require 'pry'; binding.pry
    meeting = SingleDayEvent.create!(meeting_params.merge(user_id: params[:user_id]))

    redirect_to meeting_path(meeting, user_id: meeting.user_id)
  end

  def edit
    @facade = MeetingsFacade.new(params)
  end

  def update
  meeting = SingleDayEvent.find(params[:id])

    meeting.update!(meeting_params.merge(user_id: params[:user_id]))

    redirect_to meeting_path(meeting, user_id: meeting.user_id)

  end

  def destroy
    meeting = SingleDayEvent.find(params[:id])
    if meeting.destroy
      flash[:alert] = "~Successfully deleted event~"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Unable to delete please try again"
      render :show
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:name, :notes, :location, :time)
  end
end
