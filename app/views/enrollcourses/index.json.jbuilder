json.array!(@enrollcourses) do |enrollcourse|
  json.extract! enrollcourse, :id, :code, :ccode, :remark
  json.url enrollcourse_url(enrollcourse, format: :json)
end
