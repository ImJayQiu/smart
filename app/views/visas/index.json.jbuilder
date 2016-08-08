json.array!(@visas) do |visa|
  json.extract! visa, :id, :passport, :due, :remark
  json.url visa_url(visa, format: :json)
end
