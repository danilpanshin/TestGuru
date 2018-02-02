# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
[User, Category, Test, Question, Answer].each(&:destroy_all)

User.create([
                      {name: "John Smith",
                       email: 'john@mail.com'},

                      {name: "Thomas Anderson",
                       email: 'neo@mail.com'},

                      {name: "Trinity",
                       email: 'trinity@mail.com'}
                    ])

Category.create( [
                          {title: "Frontend"},

                          {title: "Backend"},

                          {title: "Mobile"}

                 ])

Test.create([
                     {title: "Ruby",
                     level: 1},

                     {title: "HTML",
                     level: 0},

                     {title: "Swift",
                     level: 2}
            ])

Question.create([
                         {body: "What is 'let'?",
                          theme: "Swift",
                          test_id: 1},

                         {body: "What does the following code print?",
                          theme: "Ruby",
                          test_id: 1}
                ])

Answer.create([
                       {body: 'nothing',
                        question_id: 1,
                        correct: false},

                        {body: 'anything',
                        question_id: 1,
                        correct: true},

                        {body: 'everything',
                        question_id: 1,
                        correct: false},

                        {body: 'nothing',
                        question_id: 2,
                        correct: false},

                        {body: 'anything',
                        question_id: 2,
                        correct: true},

                        {body: 'everything',
                        question_id: 2,
                        correct: false}
              ])
TestPassage.create([
                    {user_id: 1,
                    test_id: 1,
                    current_question_id: 1},

                    {user_id: 2,
                     test_id: 2,
                     current_question_id: 2},

                     {user_id: 1,
                    test_id: 1,
                    current_question_id: 1},

                    {user_id: 1,
                    test_id: 1,
                    current_question_id: 1},
  ])


