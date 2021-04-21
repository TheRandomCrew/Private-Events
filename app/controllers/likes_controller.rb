class LikesController < ApplicationController
  before_action :find_event
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      @like.destroy
      flash[:notice] = "You can't like more than once"
    else
      @event.likes.create(user_id: current_user.id)
    end
    redirect_to event_path(@event)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "you can't unlike"
    else
      @like.destroy
    end
    redirect_to event_path(@event)
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, event_id:
    params[:event_id]).exists?
  end

  def find_like
    @like = @event.likes.find(params[:id])
 end
end
