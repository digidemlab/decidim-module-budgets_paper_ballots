# frozen_string_literal: true

module Decidim
  module BudgetsPaperBallots
    module ProjectVotesCountCellOverride
      def content
        if options[:layout] == :one_line
          safe_join([model.total_votes, " ", count_label])
        else
          safe_join([number, count_label])
        end
      end

      def number
        content_tag :div, model.total_votes, class: "text-large"
      end

      def count_label
        content_tag(:span, t("decidim.budgets.projects.project.votes", count: model.total_votes))
      end
    end
  end
end
