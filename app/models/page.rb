class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :finders

  ## TEMPLATE
  has_one :page_template, as: :viewable, dependent: :destroy
  accepts_nested_attributes_for :page_template, allow_destroy: true

  ## DATACONTEXT
  has_one :page_data_context, as: :viewable, dependent: :destroy
  accepts_nested_attributes_for :page_data_context, allow_destroy: true

  ## TRANSLATIONS
  has_many :page_translation, as: :viewable, dependent: :destroy
  accepts_nested_attributes_for :page_translation, allow_destroy: true, reject_if: :all_blank
end
