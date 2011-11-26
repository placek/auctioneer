  describe Array do
    describe "#push" do
      it "puts a value at the end of an array" do
        array = Array.new
        value = "Some value"
        array.push value
        array.last.should == value
      end
      it "increases a size of an array of one" do
        array = Array.new
        array_size = array.size
        array.push "Some value"
        array.size.should == (array_size + 1)
      end
    end
    describe "#pop" do
      it "gets a value from the end of an array" do
        array = Array.new
        value = "Some value"
        array.push value
        array.pop.should == value
      end
      it "increases a size of an array of one" do
        array = Array.new
        array.push "Some value"
        array_size = array.size
        array.pop
        array.size.should == (array_size + 1)
      end
    end
  end

