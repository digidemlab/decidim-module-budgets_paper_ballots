# frozen_string_literal: true

require "rails"
require "decidim/core"
require "decidim/budgets"
require "decidim/budgets_paper_ballots/import"
require "decidim/budgets_paper_ballots/project_serializer_override"

module Decidim
  module BudgetsPaperBallots
    # This is the engine that runs on the public interface of budgets_paper_ballots.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::BudgetsPaperBallots

      config.to_prepare do
        Decidim::Budgets::ProjectMetadataCell.prepend(ProjectMetadataCellOverride)
        Decidim::Budgets::ProjectVotesCountCell.prepend(ProjectVotesCountCellOverride)
        Decidim::Budgets::Admin::ProjectsController.include(ProjectsControllerOverride)
        Decidim::Budgets::Project.include(ProjectOverride)
        Decidim::Budgets::ProjectSerializer.prepend(ProjectSerializerOverride)
      end

      initializer "budgets_paper_ballots.component_override" do
        Decidim.component_registry.find(:budgets).tap do |component|
          component.imports :paper_ballot_result do |imports|
            imports.messages do |msg|
              msg.set(:resource_name) { |count: 1| I18n.t("decidim.budgets.admin.imports.resources.paper_ballot_results", count: count) }
              msg.set(:title) { I18n.t("decidim.budgets.admin.imports.title.paper_ballot_results") }
              msg.set(:label) { I18n.t("decidim.budgets.admin.imports.label.paper_ballot_results") }
              msg.set(:help) { I18n.t("decidim.budgets.admin.imports.help.paper_ballot_results") }
            end

            imports.creator Decidim::BudgetsPaperBallots::Import::PaperBallotResultCreator
          end
        end
      end

      initializer "budgets_paper_ballots.register_resources" do
        Decidim.register_resource(:paper_ballot_result) do |resource|
          resource.model_class_name = "Decidim::BudgetsPaperBallots::PaperBallotResult"
        end
      end
    end
  end
end
