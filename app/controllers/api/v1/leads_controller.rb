class Api::V1::LeadsController < ApplicationController
  skip_before_action:authorize_request
  def index
    render json: Lead.all
  end

  def create
    lead = Lead.new(lead_params)

    if lead.save
      assigned_agent =
        LeadAssignmentService
          .new(lead)
          .assign

      render json: {
        message: 'Lead created',
        lead: lead,
        assigned_to: assigned_agent&.name,
        status: assigned_agent ?
          'assigned' :
          'pending_assignment'
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
      :priority,
      :language,
      :region
    )
  end
end