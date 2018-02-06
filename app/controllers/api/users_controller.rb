class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.profile = Profile.new(
        name: @user.username,
        birthdate: Date.today - 18.years,
        gender: "Prefer Not to Say",
        primary_img_url: "https://i.imgur.com/KD3v2vP.jpg")
      @user.search_query = SearchQuery.new(
        min_age: 18,
        max_age: 99,
        active_within: 21
      )
    if @user.save
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
end
