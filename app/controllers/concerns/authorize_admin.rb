module AuthorizeAdmin
  extend ActiveSupport::Concern

  included do
    before_action :authorize_admin
  end

  private

  def authorize_admin
    return if @current_user.admin?

    render json: {
      error: 'Admin only'
    }, status: :forbidden
  end
end