json.array!(@wb_csv_lines) do |wb_csv_line|
  json.extract! wb_csv_line, :id, :code, :ocode, :arrival, :departure, :received, :name, :phone, :email, :price, :roomn, :status, :origin
  json.url wb_csv_line_url(wb_csv_line, format: :json)
end
