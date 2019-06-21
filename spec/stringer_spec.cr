require "./spec_helper"

describe Stringer do
  it "is included in String" do
    "foo-bar".should be_a(Stringer)
  end

  describe "#truncate" do
    it "has examples" do
      strum = "The quick brown fox jumps over the lazy dog"
      strum.truncate(20).should eq("The quick brown f...")
      strum.truncate(20, {:omission => "!!!"}).should eq("The quick brown f!!!")
      strum.truncate(20, {:separator => " "}).should eq("The quick brown...")
    end

    it "is unmodified when size is less than truncation length" do
      "foo-bar".truncate(10).should eq("foo-bar")
    end

    it "is unmodified when size is the same as truncation length" do
      "foo-bar".truncate(7).should eq("foo-bar")
    end

    it "is same when not truncated" do
      actual = "foo-bar"
      actual.truncate(7).should be(actual)
    end

    it "includes only omission when it's size is greater than truncation length" do
      "foo-bar".truncate(2).should eq(Stringer::DEFAULT_TRUNCATE_OMISSION)
    end

    it "truncates the string and replaces with omission" do
      "foo-bar-baz".truncate(10).should eq("foo-bar#{Stringer::DEFAULT_TRUNCATE_OMISSION}")
    end

    it "truncates the string and replaces with provided omission" do
      options = {:omission => "... (more)"}
      "foo-bar-baz-biz-bat-boo".truncate(20, options).should eq("foo-bar-ba... (more)")
    end

    it "truncates at separator break" do
      options = {:separator => " "}
      "foo bar baz biz bat boo".truncate(20, options).should eq("foo bar baz biz...")
    end

    it "truncates at separator break and replaces with provided omission" do
      options = {:separator => "-", :omission => "... (more)"}
      "foo-bar-baz-biz-bat-boo".truncate(20, options).should eq("foo-bar... (more)")
    end
  end

  describe "#squish" do
    it "trims and replaces all whitespace with a single space" do
      "  some \t\n messy\ttxt \n\t   ".squish.should eq("some messy txt")
    end

    it "works with slready well formated string" do
      "looks good".squish.should eq("looks good")
    end

    it "works with empty string" do
      "".squish.should eq("")
    end

  end
end
