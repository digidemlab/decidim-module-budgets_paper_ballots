# frozen_string_literal: true

module Decidim
  module BudgetsPaperBallots
    module Import
      # This class is responsible for creating the imported paper ballot results
      # and must be included in budgets component's import manifest.
      class PaperBallotResultCreator < Decidim::Admin::Import::Creator
        # Retuns the resource class to be created with the provided data.
        def self.resource_klass
          Decidim::BudgetsPaperBallots::PaperBallotResult
        end

        # Returns a verifier class to be used to verify the correctness of the
        # import data.
        def self.verifier_klass
          Decidim::BudgetsPaperBallots::Import::PaperBallotResultVerifier
        end

        # Produces a paper ballot result from parsed data
        #
        # Returns a paper ballot result
        def produce
          resource
        end

        # Saves the paper ballot result
        def finish!
          Decidim.traceability.perform_action!(:import, self.class.resource_klass, context[:current_user],
                                               visibility: 'admin-only') do
            resource.save!
            resource
          end
        end

        private

        def resource
          @resource ||= Decidim::BudgetsPaperBallots::PaperBallotResult.new(
            votes: votes,
            decidim_project_id: id
          )
        end

        def votes
          data[:paper_ballots_to_import].to_i
        end

        def id
          data[:id].to_i
        end
      end
    end
  end
end
