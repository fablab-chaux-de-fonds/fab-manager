json.extract! @page, :id, :name, :title, :published, :version, :sort, :icon, :created_at, :updated_at, :page_template,
              :page_data_context
json.url pages_url(@page, format: :json)