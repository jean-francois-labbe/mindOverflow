# == Schema Information
#
# Table name: articles
#
#  id                      :integer          not null, primary key
#  title                   :string(255)
#  body                    :text
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  user_id                 :integer
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#  rate                    :integer
#

require 'spec_helper'

describe Article do

  it "has a valid factory" do
    FactoryGirl.build(:article).should be_valid
  end

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
