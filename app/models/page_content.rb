class PageContent < ActiveRecord::Base
  has_one :page_template, as: :viewable, dependent: :destroy
  has_one :page_data_context, as: :viewable, dependent: :destroy
  has_many :page_translation, as: :viewable, dependent: :destroy
end
