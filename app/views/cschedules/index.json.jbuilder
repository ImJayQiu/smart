json.array!(@cschedules) do |cschedule|
	json.extract! cschedule, :id, :code, :term_code, :c_code, :stime, :etime, :lecturer, :room, :att, :homework, :project, :report, :mid, :fin, :quiz, :remark
	json.url cschedule_url(cschedule, format: :json)
end
