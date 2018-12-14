require 'slack-ruby-client'

##
# Singleton module for exposing tokens
module Limp
  class << self
    def tokens
      @tokens ||= db_files.map { |x| read_tokens(x) }.flatten.uniq
    end

    def clients
      @clients ||= tokens.map { |x| team_and_client(x) }.compact.to_h.values
    end

    private

    def team_and_client(token)
      client = Slack::Web::Client.new(token: token)
      [client.team_info.team.id, client]
    rescue Slack::Web::Api::Errors::SlackError
      nil
    end

    def base_dir
      @base_dir ||= File.expand_path(
        '~/Library/Application Support/Google/Chrome'
      )
    end

    def base_glob
      @base_glob ||= File.join(base_dir, '*/Local Storage/leveldb/*.ldb')
    end

    def db_files
      @db_files ||= Dir.glob(base_glob)
    end

    def token_regex
      @token_regex ||= /xoxs-\d+-\d+-\d+-\h+/
    end

    def read_tokens(db)
      File.read(db).force_encoding('ASCII-8BIT').scan(token_regex)
    end
  end
end
