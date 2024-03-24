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
    meeting = SingleDayEvent.create!(
      name: params[:meeting][:name].capitalize,
      notes: params[:meeting][:notes].capitalize,
      location: params[:meeting][:location].capitalize,
      user_id: params[:user_id],
      start_time: params[:meeting][:start_time],
      time: params[:meeting][:time]
    )
    redirect_to meeting_path(meeting, user_id: meeting.user_id)
  end

  def edit
    @facade = MeetingsFacade.new(params)
  end

  def update
  meeting = SingleDayEvent.find(params[:id])

    meeting.update!(
      name: params[:meeting][:name].capitalize,
      notes: params[:meeting][:notes].capitalize,
      location: params[:meeting][:location].capitalize,
      user_id: params[:user_id],
      start_time: params[:meeting][:start_time],
      time: params[:meeting][:time]
    )
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

end
