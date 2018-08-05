class API::PagesController < API::ApiController
  before_action :authenticate_user!, except: [:show, :list]
  before_action :set_page, only: [:update, :destroy, :show]
  respond_to :json

  def list
    if params.key?(:name)
      @page = Page.all.includes(:page_template, :page_data_context).where(name:params[:name]).first!
    else
      @page = Page.all.to_a()
    end
    render json: @page, status: :ok
  end

  def show

  end

  def update
    authorize Page
    begin
      if @page.update(page_params)
        render json: @page, status: :ok
      else
        render json: @page.errors, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotUnique => rnu
      render json: @page.errors, status: :conflict
    end
  end

  def create
    authorize Page
    begin
      @page = Page.new(page_params)
      if @page.save
        render json: @page, status: :created
      else
        render json: @page.errors, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotUnique => rnu
      render json: @page.errors, status: :conflict
    end
  end

  def destroy

  end

  private
  def set_page
    @page = Page.includes(:page_template, :page_data_context).find_by!(name:params[:name])
  end

  def page_params
    params.require(:page).permit(:published, :sort, :name, :version, :icon, :title,
                                 page_template_attributes: [:attachment] ,
                                 page_data_context_attributes: [:attachment])
  end
end