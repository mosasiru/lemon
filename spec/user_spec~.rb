# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'spec_helper'
describe users do
  before do
    @user = Factory.build(:test1)
  end
  it{@user.save.should be_true}
end