def error_negative_numbers?(numbers)
  numbers.match(/-\d/)
end

def sum(numbers)
  numbers.map!{|i| i.to_i }.inject(:+)
end

def clean(numbers)
  numbers.gsub!(/[^-\d]/,',')
end

def intAdd(numbers)
  fail "Negatives not allowed!" if error_negative_numbers?(numbers)
  
  return 0 if numbers.empty?
  
  clean(numbers)
  
  a = numbers.split(',')
  
  sum(a)
end

describe "String Calculator" do
  context "With a method int Add(string numbers)" do
    it "Empty String" do 
      expect(intAdd("")).to eq(0)
    end

    it "Singles and Two numbers" do
      expect(intAdd("1,2")).to eq(3)
      expect(intAdd("1,")).to eq(1)
    end 

    it "Lots of numbers" do
      expect(intAdd("4,5,6,9")).to eq(24)
    end

    it "Allow the Add method to handle new lines between numbers" do 
      expect(intAdd("1\n2,3")).to eq(6)
    end

    it "Allow the Add method to handle new lines between numbers" do 
      expect{intAdd("-1,3,-2")}.to raise_error("Negatives not allowed!")
    end
  end
end
