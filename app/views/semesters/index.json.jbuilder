json.array!(@semesters) do |semester|
  json.extract! semester, :id, :code, :ayear, :term, :s_date, :e_date, :remark
  json.url semester_url(semester, format: :json)
end
