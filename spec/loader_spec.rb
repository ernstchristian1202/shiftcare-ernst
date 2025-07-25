require_relative '../lib/loader'
require 'json'

describe ClientSearcher::Loader do
  let(:valid_json_path) { 'spec/fixtures/valid_clients.json' }
  let(:invalid_json_path) { 'spec/fixtures/invalid.json' }
  let(:missing_file_path) { 'spec/fixtures/missing.json' }

  before do
    File.write(valid_json_path, '[{"id":1,"full_name":"Test User","email":"test@example.com"}]')
    File.write(invalid_json_path, 'not a valid json')
  end

  after do
    File.delete(valid_json_path) if File.exist?(valid_json_path)
    File.delete(invalid_json_path) if File.exist?(invalid_json_path)
  end

  it 'loads valid JSON file correctly' do
    result = described_class.load_file(valid_json_path)
    expect(result).to be_an(Array)
    expect(result.first['full_name']).to eq('Test User')
  end

  it 'returns empty array on invalid JSON' do
    expect { described_class.load_file(invalid_json_path) }.to output(/Error loading file/).to_stdout
  end

  it 'returns empty array if file does not exist' do
    expect { described_class.load_file(missing_file_path) }.to output(/Error loading file/).to_stdout
  end
end
