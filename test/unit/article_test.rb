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

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
