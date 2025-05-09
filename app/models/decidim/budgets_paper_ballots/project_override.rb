# frozen_string_literal: true

module Decidim
  module BudgetsPaperBallots
    module ProjectOverride
      extend ActiveSupport::Concern

      included do
        has_many :paper_ballot_results,
                 foreign_key: "decidim_project_id",
                 class_name: "Decidim::BudgetsPaperBallots::PaperBallotResult",
                 dependent: :destroy

        ransacker :total_votes do
          query = <<-SQL.squish
          (
            SELECT SUM(votes) as total_votes
            FROM
              (
                SELECT COUNT(decidim_budgets_line_items.decidim_order_id) as votes
                FROM decidim_budgets_line_items
                LEFT JOIN decidim_budgets_orders
                ON decidim_budgets_orders.id = decidim_budgets_line_items.decidim_order_id
                WHERE decidim_budgets_orders.checked_out_at IS NOT NULL
                AND decidim_budgets_line_items.decidim_project_id = decidim_budgets_projects.id
                UNION ALL
                SELECT votes
                FROM decidim_budgets_paper_ballot_results as ballots
                WHERE ballots.decidim_project_id = decidim_budgets_projects.id
              )
          )
          SQL
          Arel.sql(query)
        end
      end

      # Public: Returns the number of paper votes for a specific project
      def paper_ballots
        paper_ballot_results.sum(:votes)
      end

      # Public: Returns the number of times a specific project has been selected through both online and paper votes.
      def total_votes
        confirmed_orders_count + paper_ballots
      end
    end
  end
end
