json.array!(@cscores) do |cscore|
  json.extract! cscore, :id, :ccode, :att, :homework, :project, :report, :mid, :fin, :quiz, :other, :remark
  json.url cscore_url(cscore, format: :json)
end
