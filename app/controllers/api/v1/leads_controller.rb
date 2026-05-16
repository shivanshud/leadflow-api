class Api::V1::LeadsController < ApplicationController
  def index
    leads = Lead.all

    render json: leads
  end

  def create
    lead = Lead.new(lead_params)

    if lead.save
      assigned_agent = User.available_agents.first

      if assigned_agent
        Assignment.create!(
          user: assigned_agent,
          lead: lead,
          assigned_at: Time.current,
          status: 'assigned'
        )
      end

      render json: {
        message: "Lead created",
        lead: lead,
        assigned_to: assigned_agent&.name
      }, status: :created
    else
      render json: {
        errors: lead.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def lead_params
    params.require(:lead).permit(
      :name,
      :phone,
      :status,
      :source,
      :priority
    )
  end
end