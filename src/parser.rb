require 'css-regex.rb'

class Parser
  def initialize(input)
    @input = input
    @position = 0
    parse
  end

  def parse
    while parseNext
    end
  end
  def parseNext
    length = 0
    key_match = nil
    finish = false
    $tokens.each_pair do |key, token|
      pattern = /^#{token.source}/
      pattern.match(@input[@position, @input.size]) do |match|
        if length < match.length
          length = match.length
          key_match = key
        end
      end
    end

    unless key_match.nil?
      puts key_match.to_s
      @position += length
      finish = @position >= @input.size
    end
    !finish
  end
end
