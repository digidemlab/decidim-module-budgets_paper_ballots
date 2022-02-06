# frozen_string_literal: true

require "rails"
require "decidim/core"
require "decidim/budgets"

module Decidim
  module BudgetsPaperBallots
    # This is the engine that runs on the public interface of budgets_paper_ballots.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::BudgetsPaperBallots
    end
  end
end
