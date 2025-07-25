module ClientSearcher
  class Searcher
    def self.search_by_name(data, query)
      return [] if query.nil? || query.strip.empty?

      data.select { |client| client["full_name"].downcase.include?(query.downcase) }
    end
  end
end
