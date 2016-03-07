
# SYLLABLE CLASSIFICATION:
# Name is usually composed from 3 different class of syllables, which include prefix, middle part and suffix.
# To declare syllable as a prefix in the file, insert "-" as a first character of the line.
# To declare syllable as a suffix in the file, insert "+" as a first character of the line.
# everything else is read as a middle part.
#
# NUMBER OF SYLLABLES:
# Names may have any positive number of syllables. In case of 2 syllables, name will be composed from prefix and suffix.
# In case of 1 syllable, name will be chosen from amongst the prefixes.
# In case of 3 and more syllables, name will begin with prefix, is filled with middle parts and ended with suffix.
#
# ASSIGNING RULES:
# I included a way to set 4 kind of rules for every syllable. To add rules to the syllables, write them right after the
# syllable and SEPARATE WITH WHITESPACE. (example: "aad +v -c"). The order of rules is not important.
#
# RULES:
# 1) +v means that next syllable must definitely start with a vocal.
# 2) +c means that next syllable must definitely start with a consonant.
# 3) -v means that this syllable can only be added to another syllable, that ends with a vocal.
# 4) -c means that this syllable can only be added to another syllable, that ends with a consonant.
class Syllable

  attr_accessor :syllable

  def initialize(arg)
    @is_prefix = false
    @is_suffix = false

    args = arg.to_s.split(' ')
    self.parse(args[0])
  end

  def is_prefix?
    @is_prefix
  end

  def is_suffix?
    @is_suffix
  end

  def parse(arg1)
    if arg1[0].eql?('-') then
      @is_prefix = true
      @syllable = arg1[1..-1]
    elsif arg1[0].eql?('+') then
      @is_suffix = true
      @syllable = arg1[1..-1]
    else
      @syllable = arg1
    end
  end

end