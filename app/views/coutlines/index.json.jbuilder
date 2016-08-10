json.array!(@coutlines) do |coutline|
  json.extract! coutline, :id, :code, :ename, :name, :des, :major, :ctype
  json.url coutline_url(coutline, format: :json)
end
