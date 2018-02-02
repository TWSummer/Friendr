json.extract! @question, :id, :question
json.options do
  json.array! @question.question_options, :id, :body
end
json.answerCount @answer_count
