describe Array do
  it { [].size == 0 }
  it { [1].should_not be_empty}
  
  before do
    @a = [1]
  end
  it { @a.should_not be_empty}
  it { @a.size.should == 1}
  it { @a.size.should_not == 0}
end