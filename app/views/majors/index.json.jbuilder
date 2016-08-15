json.array!(@majors) do |major|
  json.extract! major, :id, :code, :name, :remark
  json.url major_url(major, format: :json)
end
