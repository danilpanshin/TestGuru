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
                      points: 0},

                      {name: "Thomas Anderson",
                      points: 0},

                      {name: "Trinity",
                      points: 0}
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
                          theme: "Swift"},

                         {body: "What does the following code print?",
                          theme: "Ruby"}
                ])

Answer.create([
                       {answer: 1}
              ])

UsersTest.create([
                {user_id: 1,
                test_id: 1},

                {user_id: 2,
                 test_id: 2},

                {user_id: 3,
                 test_id: 3}
                  ])
