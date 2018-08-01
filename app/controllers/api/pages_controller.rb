class API::PagesController < API::ApiController
  before_action :authenticate_user!, except: [:show, :list]
  before_action :set_page, only: [:update]

  def list
    if params.key?(:id)
      @page = Page.all.where(id:params[:id]).first!
    elsif params.key?(:name)
      @page = Page.all.where(name:params[:name]).first!
    else
      @page = Page.all.to_a()
    end
    render json: @page, status: :ok
  end

  def show
    @page = Page.all.where(name:params[:name]).first!
    render json: @page, status: :ok
  end

  def update
    authorize Page
    if @page.update(page_params)
      render json: @page, status: :ok
    else
      render json: @page.errors, status: :unprocessable_entity
    end
  end

  def remove

  end

  private
  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:published,:sort,:name)
  end
end