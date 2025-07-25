require 'json'

module ClientSearcher
  class Loader
    def self.load_file(file_path)
      JSON.parse(File.read(file_path))
    rescue StandardError => e
      puts "Error loading file: #{e.message}"
      []
    end
  end
end
