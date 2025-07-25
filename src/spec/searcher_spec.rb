require_relative '../lib/searcher'

describe ClientSearcher::Searcher do
  let(:clients) do
    [
      { "full_name" => "Jane Doe", "email" => "jane@example.com" },
      { "full_name" => "John Smith", "email" => "john@example.com" }
    ]
  end

  it "returns matches for partial name" do
    result = described_class.search_by_name(clients, "Jane")
    expect(result.size).to eq(1)
  end

  it "returns empty for no match" do
    result = described_class.search_by_name(clients, "Alex")
    expect(result).to be_empty
  end
end
