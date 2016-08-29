json.array!(@studentscores) do |studentscore|
  json.extract! studentscore, :id, :student_code, :course_code, :att, :homework, :project, :report, :mid, :fin, :quiz, :remark
  json.url studentscore_url(studentscore, format: :json)
end
