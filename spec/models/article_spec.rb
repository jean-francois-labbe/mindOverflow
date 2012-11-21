require 'spec_helper'

describe Article do
  it "is invalid without a title" do
    FactoryGirl.build(:article, title: nil).should_not be_valid
  end

  it "is invalid without a body" do
    FactoryGirl.build(:article, body: nil).should_not be_valid
  end

  it "is valid without a tag" do
    FactoryGirl.build(:article, tag_list: nil).should be_valid
  end

  it "is valid with a tag" do
    FactoryGirl.build(:article, tag_list: 'tag').should be_valid
  end

  it "is valid with multiple tags" do
    FactoryGirl.build(:article, tag_list: 'tag, tag2, tag3 , tag4,tag5').should be_valid
  end

end
