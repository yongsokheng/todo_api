class Api::V1::TasksController < ApiController
  def index
    tasks = Task.all
    render json: {
      success: true,
      data: ActiveModel::Serializer::CollectionSerializer.new(tasks, serializer: Api::V1::TaskSerializer)
    }
  end

  def show
    task = Task.find params[:id]
    render json: {
      success: true,
      data: Api::V1::TaskSerializer.new(task)
    }
  end

  def create
    task = Task.create! task_params

    ActionCable.server.broadcast('tasks_channel',
      {type: 'add', task: Api::V1::TaskSerializer.new(task)})

    render json: {
      success: true,
      data: Api::V1::TaskSerializer.new(task)
    }
  end

  def update
    task = Task.find params[:id]
    task.update_attributes! task_params

    ActionCable.server.broadcast('tasks_channel',
      {type: 'update', task: Api::V1::TaskSerializer.new(task)})

    render json: {
      success: true,
      data: Api::V1::TaskSerializer.new(task)
    }
  end

  def destroy
    task = Task.find params[:id]

    ActionCable.server.broadcast('tasks_channel',
      {type: 'delete', task: Api::V1::TaskSerializer.new(task)})

    task.destroy!

    render json: {
      success: true
    }
  end

  private
  def task_params
    params.permit [:title, :completed]
  end
end
