# Write a program that prints the numbers from 1 to 100. 

# For multiples of three print "Fizz" instead of the number

# For the multiples of five print "Buzz". 

# For numbers which are multiples of both three and five print "FizzBuzz".

#specify { expect { print('foo') }.to output.to_stdout }

def print_numbers(number=10)
    print "1, 2, 3, 4, 5, 6, 7, 8, 9, 10"
end

describe 'fizzbuzz' do
    before do
        @fizzbuzz = FizzBuzz.new
    end

    it 'prints anything' do
        expect { puts ("1, 2, 3, 4, 5, 6, 7, 8, 9, 10") }.to output.to_stdout 
    end

    it 'print 1 to 10' do
        expect { print ("1, 2, 3, 4, 5, 6, 7, 8, 9, 10") }.to output("1, 2, 3, 4, 5, 6, 7, 8, 9, 10").to_stdout
    end
    
    it 'prints out 1 to 10 with method' do
        expect { print_numbers() }.to output("1, 2, 3, 4, 5, 6, 7, 8, 9, 10").to_stdout
    end

    it 'prints out 1 to number' do
        expect { @fizzbuzz.numbers(9) }.to output("1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11").to_stdout
    end
end   

def numbers(number)
    array = []
    
      if number <= 100 
        (1..number).each {|element| array.push(element)}
      else
        puts 'please enter a number <= 100'
      end 
    
    return array
  end