class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.profile = Profile.new(
        name: @user.username[0..23],
        birthdate: Date.today - 18.years,
        gender: "Prefer Not to Say",
        primary_img_url: "https://i.imgur.com/KD3v2vP.jpg")
      @user.search_query = SearchQuery.new(
        min_age: 18,
        max_age: 99,
        active_within: 21
      )
    if @user.save
      generate_new_user_messages
      login(@user)
      render :show
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def fetch_user
    username = params[:username]
    username = current_user.username if username == "undefined"
    @user = User.all
                   .includes(:profile)
                   .includes(:question_answers)
                   .includes(:question_friend_answers)
                   .where(username: username).first
     @cur_user = User.all
                    .includes(:profile)
                    .includes(:question_answers)
                    .includes(:question_friend_answers)
                    .where("id = #{current_user.id}").first
    if @user
      @profile = @user.profile
      render "api/profiles/view"
    else
      render json: ["Unable to locate this user"], status: 404
    end
  end

  def demo_user
    @user = User.new(username: SecureRandom.urlsafe_base64, password: "password", demo: true)
    @user.profile = Profile.new(
      name: "Ariana",
      birthdate: Date.new(1993, 6, 23),
      latitude: 37.7758,
      longitude: -122.435,
      gender: "Female",
      about_me: "I am a singer for a living, but in my free time I enjoy watching movies with friends and swimming. I have six dogs, and they love when I have company over because they get lots of attention! Aside from music, I'm also very interested in science, which was my favorite subject in school. I don't have much time to play games, but I do play Pokemon Go, so let me know if you want to capture some gyms together (team Valor).",
      looking_for: "I'm looking for friends who enjoy listening to and playing music. I can sing pretty well and I would love to meet new people that I can play with. I also make great vegan snickerdoodles, and I'd be stoked if you have other vegan recipes that we can exchange!",
      primary_img_url: "https://i.imgur.com/iAvW6U3.jpg"
    )
    @user.search_query = SearchQuery.new(
      min_age: 18,
      max_age: 99,
      active_within: 21
    )
    generate_demo_messages
    answer_demo_questions
    if @user.save
      login(@user)
      render :show
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def generate_demo_messages
    Message.create(
      sender: User.find_by(username: "RadicalPotato"),
      recipient: @user,
      body: "I'm on team Valor too! What is your level on Pokemon Go? What is your highest CP Pokemon?"
    )
    Message.create(
      sender: @user,
      recipient: User.find_by(username: "Theo"),
      body: "Hey Theo,

      Being a web developer sounds like a fascinating profession. I can't believe that you built a site like this one from scratch. It looks amazing!

      I have never met someone with a pneumatic vegetable launcher before. How did you make it?"
    )
    Message.create(
      sender: User.find_by(username: "Theo"),
      recipient: @user,
      body: "The pneumatic vegetable launcher is something I built after having a \"Pickle Eating Contest\" with my friends a few years ago that was not as successful as planned. After the competition I had a lot of pickles left over and I had to come up with something to do with all of them, so of course my first idea was... pneumatic vegetable launcher.

      I built it out of PVC parts that I got from Home Depot. There is a base that has a hole with a valve that I took from a bike tire, that you can attach a bike pump to in order to build up the pressure. Then there is a valve that you can turn to release the pressure, and on the other end of the valve is a barrel that you can shove pickles into or whatever other vegetables will fit. My friends and I have had a lot of fun over the years shooting vegetables across the local park in my neighborhood, so in that sense the pickle eating contest became a big success!"
    )
    Message.create(
      sender: @user,
      recipient: User.find_by(username: "Theo"),
      body: "Lol, that is a great story! Building a pneumatic vegetable launcher would not have been my first thought if I had a surplus of pickles. :-P"
    )
  end

  def generate_new_user_messages
    Message.create(
      sender: User.find_by(username: "Theo"),
      recipient: @user,
      body: "Welcome to Friendr!

      Friendr is a site to help people make friends. It allows you to answer match questions and then quickly find the people in your area who are best suited to being your friend based on your answers.

      If you have any questions about the App, feel free to send me a message!"
    )
  end

  def answer_demo_questions
    questions = Question.order(:id).limit(14)
    answer = QuestionAnswer.new
    answer.importance = 3
    answer.question = questions[0]
    answer.user = @user
    answer.question_option = questions[0].question_options[0]
    answer.question_friend_answers = [
      QuestionFriendAnswer.create(question_answer: answer, question_option: questions[0].question_options[0]),
      QuestionFriendAnswer.create(question_answer: answer, question_option: questions[0].question_options[2])
    ]
    answer.save

    answer = QuestionAnswer.new
    answer.importance = 3
    answer.question = questions[1]
    answer.user = @user
    answer.question_option = questions[1].question_options[2]
    answer.question_friend_answers = [
      QuestionFriendAnswer.create(question_answer: answer, question_option: questions[1].question_options[2])
    ]
    answer.save

    answer = QuestionAnswer.new
    answer.importance = 1
    answer.question = questions[2]
    answer.user = @user
    answer.question_option = questions[2].question_options[1]
    answer.question_friend_answers = [
      QuestionFriendAnswer.create(question_answer: answer, question_option: questions[2].question_options[1])
    ]
    answer.save

    answer = QuestionAnswer.new
    answer.importance = 1
    answer.question = questions[3]
    answer.user = @user
    answer.question_option = questions[3].question_options[1]
    answer.question_friend_answers = [
      QuestionFriendAnswer.create(question_answer: answer, question_option: questions[3].question_options[1]),
      QuestionFriendAnswer.create(question_answer: answer, question_option: questions[3].question_options[2])
    ]
    answer.save

    answer = QuestionAnswer.new
    answer.importance = 3
    answer.question = questions[4]
    answer.user = @user
    answer.question_option = questions[4].question_options[0]
    answer.question_friend_answers = [
      QuestionFriendAnswer.create(question_answer: answer, question_option: questions[4].question_options[0])
    ]
    answer.save

    answer = QuestionAnswer.new
    answer.importance = 3
    answer.question = questions[5]
    answer.user = @user
    answer.question_option = questions[5].question_options[0]
    answer.question_friend_answers = [
      QuestionFriendAnswer.create(question_answer: answer, question_option: questions[5].question_options[0])
    ]
    answer.save

    answer = QuestionAnswer.new
    answer.importance = 3
    answer.question = questions[6]
    answer.user = @user
    answer.question_option = questions[6].question_options[3]
    answer.question_friend_answers = [
      QuestionFriendAnswer.create(question_answer: answer, question_option: questions[6].question_options[3]),
      QuestionFriendAnswer.create(question_answer: answer, question_option: questions[6].question_options[2])
    ]
    answer.save

    answer = QuestionAnswer.new
    answer.importance = 1
    answer.question = questions[7]
    answer.user = @user
    answer.question_option = questions[7].question_options[2]
    answer.question_friend_answers = [
      QuestionFriendAnswer.create(question_answer: answer, question_option: questions[7].question_options[2])
    ]
    answer.save

    answer = QuestionAnswer.new
    answer.importance = 7
    answer.question = questions[8]
    answer.user = @user
    answer.question_option = questions[8].question_options[0]
    answer.question_friend_answers = [
      QuestionFriendAnswer.create(question_answer: answer, question_option: questions[8].question_options[0]),
      QuestionFriendAnswer.create(question_answer: answer, question_option: questions[8].question_options[1]),
      QuestionFriendAnswer.create(question_answer: answer, question_option: questions[8].question_options[2])
    ]
    answer.save

    answer = QuestionAnswer.new
    answer.importance = 3
    answer.question = questions[9]
    answer.user = @user
    answer.question_option = questions[9].question_options[0]
    answer.question_friend_answers = [
      QuestionFriendAnswer.create(question_answer: answer, question_option: questions[9].question_options[0])
    ]
    answer.save

    answer = QuestionAnswer.new
    answer.importance = 1
    answer.question = questions[10]
    answer.user = @user
    answer.question_option = questions[10].question_options[1]
    answer.question_friend_answers = [
      QuestionFriendAnswer.create(question_answer: answer, question_option: questions[10].question_options[1])
    ]
    answer.save

    answer = QuestionAnswer.new
    answer.importance = 3
    answer.question = questions[11]
    answer.user = @user
    answer.question_option = questions[11].question_options[1]
    answer.question_friend_answers = [
      QuestionFriendAnswer.create(question_answer: answer, question_option: questions[11].question_options[1])
    ]
    answer.save

    answer = QuestionAnswer.new
    answer.importance = 7
    answer.question = questions[12]
    answer.user = @user
    answer.question_option = questions[12].question_options[2]
    answer.question_friend_answers = [
      QuestionFriendAnswer.create(question_answer: answer, question_option: questions[12].question_options[2])
    ]
    answer.save

    answer = QuestionAnswer.new
    answer.importance = 7
    answer.question = questions[13]
    answer.user = @user
    answer.question_option = questions[13].question_options[0]
    answer.question_friend_answers = [
      QuestionFriendAnswer.create(question_answer: answer, question_option: questions[13].question_options[0])
    ]
    answer.save
  end
end
