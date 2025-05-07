# frozen_string_literal: true

module Decidim
  module BudgetsPaperBallots
    module ProjectMetadataCellOverride
      def voted_item
        return unless show_votes_count? && model.total_votes.positive?

        {
          cell: "decidim/budgets/project_votes_count",
          args: [model, { layout: :one_line }],
          icon: current_order_checked_out? && resource_added? ? "check-double-line" : "check-line"
        }
      end
    end
  end
end
