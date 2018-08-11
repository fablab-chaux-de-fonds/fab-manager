class API::TranslationsController < API::ApiController
  before_action :set_locale


  def show
    values = Dir[Rails.root.join('public', 'uploads', 'page_translation', 'attachment', '**/*.yml').to_s]
    I18n.load_path = (I18n.load_path + values).uniq
    @translations = I18n.t params[:state]
    if @translations.class.name == String.name and @translations.start_with?('translation missing')
      render json: {error: @translations}, status: :unprocessable_entity
    else
      render json: @translations, status: :ok
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

end