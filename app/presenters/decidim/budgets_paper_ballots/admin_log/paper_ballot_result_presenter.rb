# frozen_string_literal: true

module Decidim
  module BudgetsPaperBallots
    module AdminLog
      # This class holds the logic to present a `Decidim::BudgetsPaperBallots::PaperBallotResult`
      # for the `AdminLog` log.
      class PaperBallotResultPresenter < Decidim::Log::BasePresenter
        private

        def diff_fields_mapping
          {
            project_id: :decidim_project_id,
            votes: :votes
          }
        end

        def action_string
          case action
          when 'import'
            "decidim.budgets_paper_ballots.admin_log.paper_ballot_result.#{action}"
          else
            super
          end
        end

        def i18n_labels_scope
          'activemodel.attributes.paper_ballot_result'
        end
      end
    end
  end
end
