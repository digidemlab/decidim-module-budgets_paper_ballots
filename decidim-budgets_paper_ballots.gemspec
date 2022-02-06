# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/budgets_paper_ballots/version"

Gem::Specification.new do |s|
  s.version = Decidim::BudgetsPaperBallots::VERSION
  s.authors = ["Pierre Mesure"]
  s.email = ["pierre@mesu.re"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/decidim/decidim-module-budgets_paper_ballots"
  s.required_ruby_version = ">= 2.7"

  s.name = "decidim-budgets_paper_ballots"
  s.summary = "A decidim module to import paper ballots in PB votes"
  s.description = "A module that allows an admin to import paper ballots from a PB vote."

  s.files = Dir["{app,config,lib}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]

  s.add_dependency "decidim-core", Decidim::BudgetsPaperBallots::DECIDIM_VERSION
  s.add_dependency "decidim-budgets", Decidim::BudgetsPaperBallots::DECIDIM_VERSION
end
