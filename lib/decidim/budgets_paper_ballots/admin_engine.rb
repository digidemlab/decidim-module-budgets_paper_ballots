# frozen_string_literal: true

module Decidim
  module BudgetsPaperBallots
    # This is the engine that runs on the public interface of `BudgetsPaperBallots`.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::BudgetsPaperBallots::Admin
    end
  end
end
