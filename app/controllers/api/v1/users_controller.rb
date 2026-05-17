class Api::V1::UsersController <
  ApplicationController

  include AuthorizeAdmin

  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user,
        status: :created
    else
      render json: {
        errors:
          user.errors.full_messages
      }, status:
        :unprocessable_entity
    end
  end

  def availability
    @current_user.update!(
      available:
        params[:available]
    )

    render json: {
      available:
        @current_user.available
    }
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :role,
      :available,
      :capacity,
      :skill_level,
      languages: [],
      regions: []
    )
  end
end