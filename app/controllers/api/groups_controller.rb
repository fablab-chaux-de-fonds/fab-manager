class API::GroupsController < API::ApiController
  before_action :authenticate_user!, except: :index

  def index
    if current_user and current_user.is_admin?
      @groups = Group.all
    else
      @groups = Group.where.not(slug: 'admins')
    end

  end

  def create
    authorize Group
    @group = Group.new(group_params)
    if @group.save
      render status: :created
    else
      render json: @group.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    authorize Group
    @group = Group.find(params[:id])
    if @group.update(group_params)
      render status: :ok
    else
      render json: @group.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @group = Group.find(params[:id])
    authorize @group
    @group.destroy
    head :no_content
  end

  private

    def group_params
      params.require(:group).permit(:name, :disabled)
    end
end
