# frozen_string_literal: true

module Decidim
  module BudgetsPaperBallots
    module ProjectSerializerOverride
      def serialize
        {
          id: project.id,
          category: {
            id: project.category.try(:id),
            name: project.category.try(:name) || empty_translatable
          },
          scope: {
            id: project.scope.try(:id),
            name: project.scope.try(:name) || empty_translatable
          },
          participatory_space: {
            id: project.participatory_space.id,
            url: Decidim::ResourceLocatorPresenter.new(project.participatory_space).url
          },
          component: { id: component.id },
          title: project.title,
          description: project.description,
          budget: { id: project.budget.id },
          budget_amount: project.budget_amount,
          confirmed_votes: project.confirmed_orders_count,
          paper_ballots: project.paper_ballots,
          total_votes: project.total_votes,
          comments: project.comments_count,
          created_at: project.created_at,
          url: project.polymorphic_resource_url({}),
          related_proposals: related_proposals,
          related_proposal_titles: related_proposal_titles,
          related_proposal_urls: related_proposal_urls
        }
      end
    end
  end
end
