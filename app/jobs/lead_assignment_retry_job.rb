class LeadAssignmentRetryJob
  include Sidekiq::Job

  def perform(lead_id)
    lead = Lead.find_by(id: lead_id)

    return unless lead

    assigned_agent =
      LeadAssignmentService
        .new(lead)
        .assign

    return if assigned_agent

    self.class.perform_in(
      2.minutes,
      lead.id
    )
  end

  def my_leads
    leads =
    @current_user
      .leads

    render json: leads
  end
end