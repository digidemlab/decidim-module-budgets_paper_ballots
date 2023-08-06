# frozen_string_literal: true

module Decidim
  module BudgetsPaperBallots
    module ProjectVotesCountCellOverride
      def content
        if options[:layout] == :one_line
          safe_join([model.total_votes, " ", label(t("decidim.budgets.projects.project.votes",
                                                     count: model.total_votes))])
        else
          safe_join([number, label(t("decidim.budgets.projects.project.votes",
                                     count: model.total_votes))])
        end
      end

      def number
        content_tag :div, model.total_votes, class: "text-large"
      end
    end
  end
end
