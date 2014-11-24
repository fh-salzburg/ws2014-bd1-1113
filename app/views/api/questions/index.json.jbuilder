# json.questions(@questions, :id, :title, :answer_ids)
# json.answers(@answers, :id, :question_id, :body)
# json.questions(@questions) do |question|
#   json.extract!(question, :id, :title, :answer_ids)
# end
# json.array! @questions, :id, :title
json.array! @questions do |question|
  json.extract!(question, :id, :title, :answer_ids)
  json.other_title question.title
  json.answers question.answers do |answer|
    json.body answer.body
  end
  json.other_answers question.answers, :id, :body
  json.first_answer question.answers.first, :id, :body if question.answers.first
  json.partial_answers question.answers, partial: 'answer', as: :answer
  json.partial! 'answer', answer: question.answers.first if question.answers.first
  # ! json.partialasnswer question.answers.first, partial: 'answer', as: :answer if question.answers.first
  json.partial_first_answer do
    json.partial! 'answer', answer: question.answers.first if question.answers.first
  end
  end
