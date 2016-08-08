json.array!(@ustatuses) do |ustatus|
  json.extract! ustatus, :id, :code, :date, :status, :remark
  json.url ustatus_url(ustatus, format: :json)
end
