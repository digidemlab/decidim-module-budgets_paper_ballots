module Decidim
  module BudgetsPaperBallots
    # The data store for a paper ballot result in the Budget resource.
    class PaperBallotResult < Budgets::ApplicationRecord
      include Decidim::Resourceable
      include Decidim::Traceable
      include Decidim::Loggable

      self.table_name = 'decidim_budgets_paper_ballot_results'
      belongs_to :project, class_name: 'Decidim::Budgets::Project', foreign_key: 'decidim_project_id'

      def self.log_presenter_class_for(_log)
        Decidim::BudgetsPaperBallots::AdminLog::PaperBallotResultPresenter
      end
    end
  end
end
