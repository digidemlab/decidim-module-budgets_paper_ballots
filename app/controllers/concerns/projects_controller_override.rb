# frozen_string_literal: true

require "active_support/concern"

module ProjectsControllerOverride
  extend ActiveSupport::Concern

  included do
    helper_method :paper_ballots_count

    def paper_ballot_results
      @paper_ballot_results ||= Decidim::BudgetsPaperBallots::PaperBallotResult.joins(:project).where(decidim_budgets_projects: { decidim_budgets_budget_id: budget })
    end

    def paper_ballots_count
      paper_ballot_results.sum(:votes)
    end
  end
end
