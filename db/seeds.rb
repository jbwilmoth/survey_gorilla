User.create(email: "jay@jay.com", password: "jay", password_confirmation: "jay")
User.create(email: "a@a.com", password: "1234", password_confirmation: "1234")
User.create(email: "poodle@gmail.com", password: "1234", password_confirmation: "1234")
User.create(email: "gopher@pain.com", password: "1234", password_confirmation: "1234")

Survey.create(creator_id: 1, name: "Favorite Animals")
Question.create(survey_id: 1, content: "Favorite Snail?")
Choice.create(question_id: 1, content: "Jimmy")
Choice.create(question_id: 1, content: "Jane")

Survey.create(creator_id: 2, name: "test survey")
Question.create(survey_id: 2, content: "How do you feel today?")
Choice.create(question_id: 2, content: "Good")
Choice.create(question_id: 2, content: "Bad")

Survey.create(creator_id: 3, name: "Meal Times")
Question.create(survey_id: 3, content: "When do you eat dinner?")
Choice.create(question_id: 3, content: "Six")
Choice.create(question_id: 3, content: "Seven")

Survey.create(creator_id: 4, name: "TV Shows")
Question.create(survey_id: 4, content: "Favorite TV Character?")
Choice.create(question_id: 4, content: "Batman")
Choice.create(question_id: 4, content: "Superman")

Survey.create(creator_id: 1, name: "Alex-Questions")
Question.create(survey_id: 5, content: "Your View On Alex's Beard:")
Choice.create(question_id: 5, content: "Yes")
Choice.create(question_id: 5, content: "No")

Survey.create(creator_id: 2, name: "DBC")
Question.create(survey_id: 6, content: "What free food should be offered?")
Choice.create(question_id: 6, content: "Pizza")
Choice.create(question_id: 6, content: "Fish")
