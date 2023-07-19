# frozen_string_literal: true

require "decidim/faker/localized"
require "decidim/dev"

FactoryBot.define do
  factory :paper_ballot_result, class: "Decidim::BudgetsPaperBallots::PaperBallotResult" do
    votes { Faker::Number.number(digits: 3) }
    project { create(:project) }
  end
end
