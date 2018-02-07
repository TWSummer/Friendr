Question.all.each do |question|
  question.destroy
end

question = Question.create(question: 'Do you prefer spending time with a few close friends or attending large social gatherings?')

QuestionOption.create(question_id: question.id, body: 'A few close friends')
QuestionOption.create(question_id: question.id, body: 'Large social gatherings')
QuestionOption.create(question_id: question.id, body: 'I enjoy both equally')

question = Question.create(question: 'Do you flake out on social invitations?')

QuestionOption.create(question_id: question.id, body: 'Often')
QuestionOption.create(question_id: question.id, body: 'Sometimes')
QuestionOption.create(question_id: question.id, body: 'Rarely / Never')

question = Question.create(question: 'Would you consider going skydiving with a friend who wanted to try it?')

QuestionOption.create(question_id: question.id, body: 'Yes')
QuestionOption.create(question_id: question.id, body: 'No')

question = Question.create(question: 'How many books have you read in the last year?')

QuestionOption.create(question_id: question.id, body: 'Less than 5')
QuestionOption.create(question_id: question.id, body: '5 to 15')
QuestionOption.create(question_id: question.id, body: 'More than 15')

question = Question.create(question: 'Do you enjoy finding out what makes things work the way they do?')

QuestionOption.create(question_id: question.id, body: 'I\'m an information sponge')
QuestionOption.create(question_id: question.id, body: 'Sometimes')
QuestionOption.create(question_id: question.id, body: 'As long as it works, who cares why?')

question = Question.create(question: 'Do you put more weight in science or faith?')

QuestionOption.create(question_id: question.id, body: 'Science')
QuestionOption.create(question_id: question.id, body: 'Faith')
QuestionOption.create(question_id: question.id, body: 'Equally in both')

question = Question.create(question: 'What percentage of your salary do you donate to charity?')

QuestionOption.create(question_id: question.id, body: 'Less than 2%')
QuestionOption.create(question_id: question.id, body: 'At least 2% but less than 5%')
QuestionOption.create(question_id: question.id, body: 'At least 5% but less than 15%')
QuestionOption.create(question_id: question.id, body: 'At least 15%')

question = Question.create(question: 'Can you run a mile without stopping??')

QuestionOption.create(question_id: question.id, body: 'Yes')
QuestionOption.create(question_id: question.id, body: 'No')
QuestionOption.create(question_id: question.id, body: 'Yes - And More')

question = Question.create(question: 'Who do you think was the smartest on this list?')

QuestionOption.create(question_id: question.id, body: 'Einstein')
QuestionOption.create(question_id: question.id, body: 'Shakespeare')
QuestionOption.create(question_id: question.id, body: 'Mozart')
QuestionOption.create(question_id: question.id, body: 'Jesus')

question = Question.create(question: 'Do you enjoy helping others?')

QuestionOption.create(question_id: question.id, body: 'Yes')
QuestionOption.create(question_id: question.id, body: 'No')

question = Question.create(question: 'Which would you prefer your ideal friend to be more into?')

QuestionOption.create(question_id: question.id, body: 'Sports')
QuestionOption.create(question_id: question.id, body: 'Books')
QuestionOption.create(question_id: question.id, body: 'Music')
QuestionOption.create(question_id: question.id, body: 'Movies')

question = Question.create(question: 'Are you annoyed by people who are super logical?')

QuestionOption.create(question_id: question.id, body: 'Yes')
QuestionOption.create(question_id: question.id, body: 'No')

question = Question.create(question: 'Do you litter?')

QuestionOption.create(question_id: question.id, body: 'Often')
QuestionOption.create(question_id: question.id, body: 'Rarely')
QuestionOption.create(question_id: question.id, body: 'Never')

question = Question.create(question: 'Are you either vegetarian or vegan?')

QuestionOption.create(question_id: question.id, body: 'Yes')
QuestionOption.create(question_id: question.id, body: 'No')

question = Question.create(question: 'Which type of museum would you most enjoy visiting?')

QuestionOption.create(question_id: question.id, body: 'An art museum')
QuestionOption.create(question_id: question.id, body: 'A science museum')
QuestionOption.create(question_id: question.id, body: 'A history museum')
QuestionOption.create(question_id: question.id, body: 'I would dislike all of these')

question = Question.create(question: 'How often do you get angry?')

QuestionOption.create(question_id: question.id, body: 'Very often')
QuestionOption.create(question_id: question.id, body: 'Sometimes')
QuestionOption.create(question_id: question.id, body: 'Rarely')

question = Question.create(question: 'Which of the following do you consider to be the best explanation for the existence of human life on Earth?')

QuestionOption.create(question_id: question.id, body: 'Humans evolved from other species.')
QuestionOption.create(question_id: question.id, body: 'Humans were created by a higher power.')
QuestionOption.create(question_id: question.id, body: 'Humans were brought to Earth from the stars.')
QuestionOption.create(question_id: question.id, body: 'I\'m not sure.')

question = Question.create(question: 'Do you have any children?')

QuestionOption.create(question_id: question.id, body: 'Yes, and they still live with me')
QuestionOption.create(question_id: question.id, body: 'Yes, but they are all out of the house')
QuestionOption.create(question_id: question.id, body: 'No')

question = Question.create(question: 'Would you prefer good things happened, or interesting things?')

QuestionOption.create(question_id: question.id, body: 'Good')
QuestionOption.create(question_id: question.id, body: 'Interesting')

question = Question.create(question: 'Which best represents your opinion of same-sex relationships?')

QuestionOption.create(question_id: question.id, body: 'Girl-on-girl is okay, but guy-on-guy is wrong.')
QuestionOption.create(question_id: question.id, body: 'Guy-on-guy is okay, but girl-on-girl is wrong.')
QuestionOption.create(question_id: question.id, body: 'All same-sex relationships are wrong.')
QuestionOption.create(question_id: question.id, body: 'It\'s all fine by me.')

question = Question.create(question: 'Which of the following best describes your typical demeanor?')

QuestionOption.create(question_id: question.id, body: 'Cheerful! I have a positive outlook.')
QuestionOption.create(question_id: question.id, body: 'Meh. I have my ups and downs.')
QuestionOption.create(question_id: question.id, body: 'Annoyed. The world sucks.')

question = Question.create(question: 'What do you think is the best way to for the government to balance the budget?')

QuestionOption.create(question_id: question.id, body: 'Cut services and keep taxes at the same level.')
QuestionOption.create(question_id: question.id, body: 'Raise taxes and keep services at the same level.')

question = Question.create(question: 'If someone identifies as a feminist, does that raise or lower your opinion of them?')

QuestionOption.create(question_id: question.id, body: 'It raises my opinion.')
QuestionOption.create(question_id: question.id, body: 'It lowers my opinion.')
QuestionOption.create(question_id: question.id, body: 'It has no effect on my opinion.')

question = Question.create(question: 'Have you ever attended a political demonstration or convention?')

QuestionOption.create(question_id: question.id, body: 'Yes')
QuestionOption.create(question_id: question.id, body: 'No')

question = Question.create(question: 'Are you a beer snob?')

QuestionOption.create(question_id: question.id, body: 'Yes')
QuestionOption.create(question_id: question.id, body: 'No')
QuestionOption.create(question_id: question.id, body: 'Not usually, but some beers I won\'t touch.')
QuestionOption.create(question_id: question.id, body: 'I don\'t drink.')

question = Question.create(question: 'Which is bigger?')

QuestionOption.create(question_id: question.id, body: 'The Earth')
QuestionOption.create(question_id: question.id, body: 'The Sun')

question = Question.create(question: 'Should evolution and creationism be taught side-by-side in school?')

QuestionOption.create(question_id: question.id, body: 'Yes, students should hear both sides')
QuestionOption.create(question_id: question.id, body: 'No, creationism has no place in schools')
QuestionOption.create(question_id: question.id, body: 'No, evolution has no place in schools')

question = Question.create(question: 'Do you believe in reincarnation?')

QuestionOption.create(question_id: question.id, body: 'Yes')
QuestionOption.create(question_id: question.id, body: 'No')

question = Question.create(question: 'Do you read the news most days?')

QuestionOption.create(question_id: question.id, body: 'Yes')
QuestionOption.create(question_id: question.id, body: 'No')

question = Question.create(question: 'How often do you go "clubbing" (out dancing in bars)?')

QuestionOption.create(question_id: question.id, body: 'Lots')
QuestionOption.create(question_id: question.id, body: 'Sometimes')
QuestionOption.create(question_id: question.id, body: 'Rarely')
QuestionOption.create(question_id: question.id, body: 'Never')

question = Question.create(question: 'If you flipped three pennies, what would be the odds that they all came out the same?')

QuestionOption.create(question_id: question.id, body: 'I admit, I don\'t know!')
QuestionOption.create(question_id: question.id, body: '1 in 3')
QuestionOption.create(question_id: question.id, body: '1 in 4')
QuestionOption.create(question_id: question.id, body: '1 in 8')

question = Question.create(question: 'Do you enjoy camping?')

QuestionOption.create(question_id: question.id, body: 'Yes')
QuestionOption.create(question_id: question.id, body: 'No')

question = Question.create(question: 'Have you smoked a cigarette in the last 6 months?')

QuestionOption.create(question_id: question.id, body: 'Yes')
QuestionOption.create(question_id: question.id, body: 'No')

question = Question.create(question: 'Do you participate in any team sports (eg: basketball, soccer, baseball)?')

QuestionOption.create(question_id: question.id, body: 'Yes')
QuestionOption.create(question_id: question.id, body: 'No, but I would like to')
QuestionOption.create(question_id: question.id, body: 'No, and I prefer not to')

question = Question.create(question: 'Do you consider astrology to be a legitimate science?')

QuestionOption.create(question_id: question.id, body: 'Yes')
QuestionOption.create(question_id: question.id, body: 'No')

question = Question.create(question: 'Are you looking for another couple to become friends with?')

QuestionOption.create(question_id: question.id, body: 'No, I am not in a relationship')
QuestionOption.create(question_id: question.id, body: 'No, I would prefer to do things without my partner')
QuestionOption.create(question_id: question.id, body: 'Yes, I would like for me and my partner to become friends with another couple')

question = Question.create(question: 'Is being "in-style" with regards to fashion important to you?')

QuestionOption.create(question_id: question.id, body: 'Yes, Extremely')
QuestionOption.create(question_id: question.id, body: 'Yeah, sometimes')
QuestionOption.create(question_id: question.id, body: 'Not really')
QuestionOption.create(question_id: question.id, body: 'No Way!')

question = Question.create(question: 'When deciding what is right and wrong you are:')

QuestionOption.create(question_id: question.id, body: 'More emotional')
QuestionOption.create(question_id: question.id, body: 'More logical')
QuestionOption.create(question_id: question.id, body: 'Religion/faith determines it.')
QuestionOption.create(question_id: question.id, body: 'I am not sure/other reasons.')

question = Question.create(question: 'A difference of opinion over which of the following topics would most likely make you think twice about being friends with someone?')

QuestionOption.create(question_id: question.id, body: 'Abortion')
QuestionOption.create(question_id: question.id, body: 'Politics')
QuestionOption.create(question_id: question.id, body: 'Death Penalty')
QuestionOption.create(question_id: question.id, body: 'None of these would.')

question = Question.create(question: 'On average, how much time per week do you spend playing video games?')

QuestionOption.create(question_id: question.id, body: '<1 hour')
QuestionOption.create(question_id: question.id, body: '1-5 hours')
QuestionOption.create(question_id: question.id, body: '5-10 hours')
QuestionOption.create(question_id: question.id, body: '10-20 hours')
QuestionOption.create(question_id: question.id, body: '>20 hours')

question = Question.create(question: 'Would you be comfortable being friends with someone who is transgender?')

QuestionOption.create(question_id: question.id, body: 'Yes')
QuestionOption.create(question_id: question.id, body: 'No')
QuestionOption.create(question_id: question.id, body: 'I\'m Not Sure')

question = Question.create(question: 'Are you happy with your life?')

QuestionOption.create(question_id: question.id, body: 'Yes')
QuestionOption.create(question_id: question.id, body: 'No')

question = Question.create(question: 'Do you think homosexuality is a sin?')

QuestionOption.create(question_id: question.id, body: 'Yes')
QuestionOption.create(question_id: question.id, body: 'No')

question = Question.create(question: 'Do you know how to surf?')

QuestionOption.create(question_id: question.id, body: 'Yes')
QuestionOption.create(question_id: question.id, body: 'No, but it seems interesting')
QuestionOption.create(question_id: question.id, body: 'No, and I don\'t think it would interest me')

question = Question.create(question: 'Do you participate in any individual sports (eg: running, swimming, or skiing)?')

QuestionOption.create(question_id: question.id, body: 'Yes')
QuestionOption.create(question_id: question.id, body: 'No, but I would like to')
QuestionOption.create(question_id: question.id, body: 'No, and I prefer not to')

question = Question.create(question: 'Do you like word games like Scrabble or Boggle?')

QuestionOption.create(question_id: question.id, body: 'Yes')
QuestionOption.create(question_id: question.id, body: 'No')

question = Question.create(question: 'Have you ever plead guilty, no contest or been convicted of a crime?')

QuestionOption.create(question_id: question.id, body: 'Yes')
QuestionOption.create(question_id: question.id, body: 'No')

question = Question.create(question: 'Are you almost always on time?')

QuestionOption.create(question_id: question.id, body: 'Yes')
QuestionOption.create(question_id: question.id, body: 'No')

question = Question.create(question: 'Assume you have a homosexual friend who is the same gender as you. Would it bother you if they hugged you?')

QuestionOption.create(question_id: question.id, body: 'Yes')
QuestionOption.create(question_id: question.id, body: 'No')
QuestionOption.create(question_id: question.id, body: 'Only if I thought the hug was more than friendly.')

question = Question.create(question: 'Which would you rather choose: peace on Earth or loads of money?')

QuestionOption.create(question_id: question.id, body: 'Peace on Earth')
QuestionOption.create(question_id: question.id, body: 'Loads of money')

question = Question.create(question: 'What is the farthest you have walked in a single day in the last 10 years?')

QuestionOption.create(question_id: question.id, body: 'Less than 1 mile')
QuestionOption.create(question_id: question.id, body: 'At least 1 mile, but less than 5 miles')
QuestionOption.create(question_id: question.id, body: 'At least 5 miles, but less than 10 miles')
QuestionOption.create(question_id: question.id, body: 'At least 10 miles, but less than 20 miles')
QuestionOption.create(question_id: question.id, body: 'At least 20 miles')

question = Question.create(question: 'How often do you do things out of spite?')

QuestionOption.create(question_id: question.id, body: 'Very often')
QuestionOption.create(question_id: question.id, body: 'Sometimes')
QuestionOption.create(question_id: question.id, body: 'Rarely')
QuestionOption.create(question_id: question.id, body: 'Never')
