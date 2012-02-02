require "spec_helper"

describe ApplicationHelper do
  describe "#button_link_to" do
    it "has data-role button" do
      html = helper.button_link_to "foo", "/bar"
      html.should == %{<a href="/bar" data-role="button">foo</a>}
    end

    it "allows me to override data-role" do
      html = helper.button_link_to "foo", "/bar", "data-role" => "baz"
      html.should == %{<a href="/bar" data-role="baz">foo</a>}
    end

    it "allows me to pass other options" do
      html = helper.button_link_to "foo", "/bar", :pass => 1
      html.should == %{<a href="/bar" data-role="button" pass="1">foo</a>}
    end
  end
end