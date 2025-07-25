require_relative '../lib/duplicate_finder'

describe ClientSearcher::DuplicateFinder do
  let(:clients) do
    [
      { "full_name" => "A", "email" => "a@example.com" },
      { "full_name" => "B", "email" => "b@example.com" },
      { "full_name" => "C", "email" => "a@example.com" }
    ]
  end

  it "detects duplicate emails" do
    dupes = described_class.find_duplicate_emails(clients)
    expect(dupes["a@example.com"].size).to eq(2)
  end

  it "returns empty hash when no duplicates" do
    unique_clients = clients.take(0)
    dupes = described_class.find_duplicate_emails(unique_clients)
    expect(dupes).to be_empty
  end
end
