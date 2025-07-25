require_relative 'loader'
require_relative 'searcher'
require_relative 'duplicate_finder'

module ClientSearcher
  class App
    USAGE = <<~TEXT
      Usage:
        ruby run.rb search <query>     - Search clients by partial name
        ruby run.rb duplicates         - Find duplicate emails
    TEXT

    def initialize(args)
      @args = args
      @data = Loader.load_file('clients.json')
    end

    def run
      if @args.empty?
        puts "Please enter a command."
        puts USAGE
        return
      end

      command = @args[0]
      arg = @args[1..]&.join(' ')

      case command
      when 'search'
        if arg.nil? || arg.strip.empty?
          puts "Please provide a search query."
          puts USAGE
        else
          results = Searcher.search_by_name(@data, arg)
          if results.any?
            results.each { |c| puts "#{c['full_name']} (ID: #{c['id']}, Email: #{c['email']})" }
          else
            puts "No clients matched \"#{arg}\""
          end
        end
      when 'duplicates'
        dupes = DuplicateFinder.find_duplicate_emails(@data)
        if dupes.any?
          dupes.each do |email, clients|
            puts "Duplicate Email: #{email}"
            clients.each { |c| puts "  - #{c['full_name']} (ID: #{c['id']})" }
          end
        else
          puts "No duplicate emails found"
        end
      else
        puts "Unknown command: '#{command}'"
        puts USAGE
      end
    end
  end
end