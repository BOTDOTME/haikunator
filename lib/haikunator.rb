require "haikunator/version"
require "securerandom"

module Haikunator
  class << self
    def haikunate(token_range = 9999, delimiter = "-")
      build(token_range, delimiter)
    end

    private

    def build(token_range, delimiter)
      sections = [
        adjectives[random_seed % adjectives.length],
        nouns[random_seed % nouns.length],
        token(token_range)
      ]

      sections.compact.join(delimiter)
    end

    def random_seed
      SecureRandom.random_number(4096)
    end

    def token(range)
      SecureRandom.random_number(range) if range > 0
    end

    def adjectives
      %w(
        pool car can mtn spkr fan dry cord wire sun desk
        head ice wtr trip flip surf sand sea tv palm fire
        wind fart toot butt
      )
    end

    def nouns
      %w(
        cool lit poor sad fun sick meh ok dope chill lit
        good nice neat fun gnar eww boom fast fizz fun glee
        kind mild pro pure top
      )
    end
  end
end
