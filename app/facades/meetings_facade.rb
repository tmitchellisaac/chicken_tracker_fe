class MeetingsFacade
  attr_reader :user_id

  def initialize(params)
    @id = params[:id]
    @user_id = params[:user_id]
  end

  def user_meetings
    single = SingleDayEvent.where(user_id: @user_id)
    multi = MultiDayEvent.where(user_id: @user_id)
    [single, multi].flatten
  end

  def meeting 
    SingleDayEvent.find(@id)
  end
end