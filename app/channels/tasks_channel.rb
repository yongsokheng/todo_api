class TasksChannel < ApplicationCable::Channel
  def subscribed
    stream_from "tasks_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
