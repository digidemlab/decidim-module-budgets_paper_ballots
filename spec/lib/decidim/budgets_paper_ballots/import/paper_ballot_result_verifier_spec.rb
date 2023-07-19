# frozen_string_literal: true

require "spec_helper"

describe Decidim::BudgetsPaperBallots::Import::PaperBallotResultVerifier do
  subject do
    described_class.new(
      headers: %w(id paper_ballots_to_import),
      data: data,
      reader: Decidim::Admin::Import::Readers::XLSX,
      context: nil
    )
  end

  let(:paper_ballot_result) { create(:paper_ballot_result) }
  let(:data) { [paper_ballot_result] }

  it "is valid" do
    expect(subject).to be_valid
  end
end
