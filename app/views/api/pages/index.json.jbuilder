json.array!(@pages) do |page|
  json.extract! page, :id, :name, :published, :page_template, :page_data_context, :sort
  json.url page_url(page, format: :json)
end
