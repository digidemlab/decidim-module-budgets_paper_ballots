# frozen_string_literal: true

module Decidim
  module BudgetsPaperBallots
    module ProjectOverride
      extend ActiveSupport::Concern

      included do
        has_many :paper_ballot_results, foreign_key: "decidim_project_id", class_name: "Decidim::BudgetsPaperBallots::PaperBallotResult"
      end

      # Public: Returns the number of paper votes for a specific project
      def paper_ballots
        paper_ballot_results.sum(:votes)
      end

      # Public: Returns the number of times a specific project has been selected through both online and paper votes.
      def total_votes
        confirmed_orders_count() + paper_ballots()
      end
    end
  end
end
