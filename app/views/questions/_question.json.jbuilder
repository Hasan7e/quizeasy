json.extract! question, :id, :quiz_id, :text, :created_at, :updated_at
json.url question_url(question, format: :json)
