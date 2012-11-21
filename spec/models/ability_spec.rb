require 'spec_helper'
require "cancan/matchers"

describe Ability do

  it 'allows an admin to manage all' do
    user = FactoryGirl.build(:user, role: "admin")
    abilities = Ability.new(user)
    abilities.can?(:manage, :all).should be_true
  end

  it 'allows banned users to read articles' do
    user = FactoryGirl.build(:user, role: "banned")
    abilities = Ability.new(user)
    abilities.can?(:read, Article.new).should be_true
  end

  it 'forbid banned users to create articles' do
    user = FactoryGirl.build(:user, role: "banned")
    abilities = Ability.new(user)
    abilities.can?(:read, Article.new).should be_true
  end

end
