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
    meeting = SingleDayEvent.create!(meeting_params)

    redirect_to meeting_path(meeting, user_id: meeting.user_id)
  end

  def edit
    @facade = MeetingsFacade.new(params)
  end

  def update
  meeting = SingleDayEvent.find(params[:id])

    meeting.update!(meeting_params)

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
    meeting_params = params.require(:meeting).permit(:name, :notes, :location, :start_time, :time).merge(user_id: params[:user_id])
    date_params = format_date_params  # Extract date parameters
    date = Date.new(*date_params.values.map(&:to_i))  # Convert date parameters to a Date object
    meeting_params[:start_time] = date  # Assign the Date object back to the meeting_params hash
    meeting_params
  end

  def format_date_params
    date_params = Hash.new
    date_params[:year] = params[:meeting]["start_time(1i)"].to_i
    date_params[:month] = params[:meeting]["start_time(2i)"].to_i
    date_params[:day] = params[:meeting]["start_time(3i)"].to_i
    date_params
  end
end
