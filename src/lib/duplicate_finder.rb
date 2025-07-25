module ClientSearcher
  class DuplicateFinder
    def self.find_duplicate_emails(data)
      grouped = data.group_by { |client| client["email"] }
      grouped.select { |_, clients| clients.size > 1 }
    end
  end
end
