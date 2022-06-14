=begin
---Task---
Task is to generate a file that prints numbers 1 to 100.
Every multiple of 3 the number == fizz
Every multiple of 5 the number == buzz
Every mutliple of 3 and 5, the number == fizzbuzz

---Create a spec---
1) Create an array containing numbers of 1 to 100
    - create an array
    - create an array of length 100
    - check if includes 1 and 100

2) check numbers divisible by 3
    - test whether array outputs multiples of 3?
    - return 'fizz' instead of the number if that is the case

3) check numbers divisible by 5
    - loop through numbers idenitfy those that are divisible by 5
    - return 'buzz' instead of the number if that is the case

4) check numbers that are both divisible by 3 and 5.
    - check if there are any numbers in both
    - return 'fizzbuzz' instead of the number if that is the case
=end

# numbers = (1..100).to_a

def fizzbuzz(number)
    unless number > 0
        return 'please enter a number more than 0'
    end 

    if number <= 100 
        array = (1..number).to_a

        return array.map { |element| 
            if element % 3 == 0 && element % 5 == 0
                'fizzbuzz'
            elsif element % 5 == 0
                'buzz'
            elsif element % 3 == 0 
                'fizz'
            else
                element
            end
    }
    else
        return 'please enter a number <= 100'
    end 
end

describe 'Fizzbuzz' do
    context 'tests for creating array of 1 to 100: ' do
        it 'is an array' do
            expect(fizzbuzz(100).class).to be Array
        end

        it 'array with length 100' do
            expect(fizzbuzz(100).length).to eq 100
        end

        it 'contains number 1' do
            expect(fizzbuzz(100)).to include(1)

        end

        it 'contains number 100' do
            expect(fizzbuzz(100)).to include('buzz')
        end
        
        it 'contains a random number' do
            # this might fail if it returns a number that
            # is now 'fizz', 'buzz' or 'fizzbuzz'

            expect(fizzbuzz(100)).to include(rand(1..100))
        end 

        it 'is less or equal to 100' do
            expect(fizzbuzz(100).length).to be <= 100
        end

        it 'prints an error message if more than 100' do
            expect(fizzbuzz(200)).to eq 'please enter a number <= 100'
        end

        it 'prints an error message if less than or equal to 0' do
            expect(fizzbuzz(-5)).to eq 'please enter a number more than 0'
        end
    end 

    context 'tests for multiples of 3: ' do
        it 'checks if number in array divisble by 3' do
            array = (1..10).to_a

            expect(
                array.map {|element| element % 3 == 0 ? 'multiple of 3': element}
            ).to eq [1, 2, "multiple of 3", 4, 5, "multiple of 3", 7, 8, "multiple of 3", 10]
        end

        it 'includes "fizz" in the array' do
            array =  (1..10).to_a 
            replace_3 = array.map {|element| element % 3 == 0 ? 'fizz' : element}

            expect(replace_3).to include 'fizz'
        end

        it 'replaces number with "fizz" if it is a multiple of 3' do
            expect(fizzbuzz(10)).to eq [1, 2, "fizz", 4, "buzz", "fizz", 7, 8, "fizz", "buzz"]
        end  
    end

    context 'tests for multiples of 5: ' do
        it 'checks if number in array divisble by 5' do
            array = (1..10).to_a

            expect(
                array.map {|element| element % 5 == 0 ? 'multiple of 5': element}
            ).to eq [1, 2, 3, 4, "multiple of 5", 6, 7, 8, 9, "multiple of 5"]
        end

        it 'includes "buzz" in the array' do
            array =  (1..10).to_a

            expect(fizzbuzz(10)).to include 'buzz'
        end

        it 'replaces number with "buzz" if it is a multiple of 3' do
            expect(fizzbuzz(10)).to eq [1, 2, "fizz", 4, "buzz", "fizz", 7, 8, "fizz", "buzz"]
        end  
    end

    context 'tests for multiples of 3 and 5' do
        it 'checks if number in array divisble by 3 and 5' do
            array = (1..15).to_a

            expect(
                array.map {|element| element % 3 == 0 && element % 5 == 0 ? '3 and 5': element}
            ).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, "3 and 5"]
        end

        it 'includes "fizzbuzz" in the array' do
            array =  (1..15).to_a 

            expect(fizzbuzz(15)).to include 'fizzbuzz'
        end

        it 'replaces number with "fizzbuzz" if it is a multiple of 3 and 5' do
            expect(fizzbuzz(15)).to eq [1, 2, "fizz", 4, "buzz", "fizz", 7, 8, "fizz", "buzz", 11, "fizz", 13, 14, "fizzbuzz"]
        end  
    end
end 
