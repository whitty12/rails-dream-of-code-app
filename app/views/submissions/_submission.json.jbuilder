json.extract! submission, :id, :lesson_id, :student_id, :mentor_id, :review_result, :submitted_at, :reviewed_at, :created_at, :updated_at
json.url submission_url(submission, format: :json)
