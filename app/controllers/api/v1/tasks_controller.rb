class Api::V1::TasksController < ApiController
  def create
    task = Task.create! task_params

    render json: {
      success: true,
      data: Api::V1::TaskSerializer.new(task)
    }
  end

  private
  def task_params
    params.permit [:title]
  end
end
