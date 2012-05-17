require 'css-regex.rb'

class Parser
  def initialize(input)
    @input = input
    @position = 0
    parse
  end

  def parse
    # calls parseNext until we reached the end of @input
    while parseNext
    end
  end
  def parseNext
    length = 0
    key_match = nil
    finish = false
    # try to match each token and get the index of the longest match
    $tokens.each_pair do |key, token|
      pattern = /^#{token.source}/
      pattern.match(@input[@position, @input.size]) do |match|
        # longer match?
        if length < match.length
          length = match.length
          key_match = key
        end
      end
    end

    # did any token match?
    unless key_match.nil?
      # if yes print it out
      puts key_match.to_s
      @position += length
      finish = @position >= @input.size
    end
    !finish
  end
end
