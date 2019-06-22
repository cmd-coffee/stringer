# Stringer (\ˈstriŋ-ər\) - one that strings.
#
# Useful utilities patched on top of the lovely `String`. Getting started is
# easy! Just add the `Stringer` shard as a dependency and then it's as simple
# as strumming along:
#
# ```
# strum = "The quick brown fox jumps over the lazy dog"
# strum.truncate(28) # => "The quick brown fox jumps..."
# ```
module Stringer
  DEFAULT_TRUNCATE_OMISSION = "..."

  # Returns a string truncated at the specified *length*.
  #
  # Options:
  #   - :omission => postfix applied to the truncated string (default "...")
  #   - :separator => separator to use for clean breaks (default nil)
  #
  # Examples:
  #
  # ```
  # strum = "The quick brown fox jumps over the lazy dog"
  # strum.truncate(20)                       # => "The quick brown f..."
  # strum.truncate(20, {:omission => "!!!"}) # => "The quick brown f!!!"
  # strum.truncate(20, {:separator => " "})  # => "The quick brown..."
  # ```
  #
  # Hat tip to Ruby on Rails inflections [String#truncate](https://api.rubyonrails.org/classes/String.html#method-i-truncate)
  def truncate(length, options = {} of Symbol => String)
    return self if size <= length

    omission = options[:omission]? || DEFAULT_TRUNCATE_OMISSION
    length_with_omission = length - omission.size

    return omission if length_with_omission <= 0

    stop = rindex(options[:separator], length_with_omission) if options[:separator]?
    stop ||= length_with_omission

    "#{self[0, stop]}#{omission}"
  end

  # Trims leading/trailing whitespace and compacts internal whitespace
  #
  # Examples:
  #
  # ```
  # strum = "  some \t\n messy\ttxt \n\t   "
  # strum.squish # => "some messy txt"
  # ```
  #
  # Hat tip to Ruby on Rails inflections [String#squish](https://api.rubyonrails.org/classes/String.html#method-i-squish)
  def squish
    self.strip.gsub(/\s+/, ' ')
  end
end

# :nodoc:
class String
  include Stringer
end
