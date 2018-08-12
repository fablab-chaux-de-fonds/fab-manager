json.extract! @page, :id, :name, :title, :published, :version, :sort, :icon, :created_at, :updated_at, :page_template,
              :page_data_context
json.url pages_url(@page, format: :json)
json.page_translation_attributes @page.page_translation do |f|
  json.id f.id
  json.attachment f.attachment_identifier
  json.attachment_url f.attachment_url
end