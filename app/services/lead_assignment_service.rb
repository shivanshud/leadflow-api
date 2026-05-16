class LeadAssignmentService
  def initialize(lead)
    @lead = lead
  end

  def assign
    eligible_agents = filtered_agents

    return nil if eligible_agents.empty?

    best_agent = scored_agents(eligible_agents).first

    Assignment.create!(
      user: best_agent,
      lead: @lead,
      assigned_at: Time.current,
      status: 'assigned'
    )

    best_agent.increment!(
      :active_leads_count
    )

    best_agent
  end

  private

  def filtered_agents
    agents = User.available_agents

    agents = agents.select do |agent|
      agent.languages.include?(@lead.language)
    end

    agents = agents.select do |agent|
      agent.regions.include?(@lead.region)
    end

    if high_priority?
      agents = agents.reject(&:junior?)
    end

    agents
  end

  def scored_agents(agents)
    agents.sort_by do |agent|
      [
        -skill_score(agent),
        agent.active_leads_count
      ]
    end
  end

  def skill_score(agent)
    case agent.skill_level
    when "senior"
      3
    when "mid"
      2
    else
      1
    end
  end

  def high_priority?
    @lead.priority == 'high'
  end
end