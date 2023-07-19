# frozen_string_literal: true

require "spec_helper"

describe Decidim::BudgetsPaperBallots::PaperBallotResult do
  subject { paper_ballot_result }

  let(:paper_ballot_result) { build(:paper_ballot_result) }

  it { is_expected.to be_valid }
end
