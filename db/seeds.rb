# create questions
question_1 = Question.create!(title: "first question", body: "lorem ipsum...")
question_2 = Question.create!(title: "second question", body: "lorem ipsum...")

#create answers
question_1.answers.create!(body: "first answer to first question")
question_1.answers.create!(body: "second answer to first question")
question_2.answers.create!(body: "first answer to second question")
question_2.answers.create!(body: "second answer to second question")
