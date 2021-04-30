class Array

    def my_each(&prc)
        self.length.times do |i|
            prc.call(self[i])
        end

        self
    end

    def my_select(&prc)
        new_array = []

        self.my_each do |ele|
            if prc.call(ele)
                new_array << ele
            end
        end
        
        new_array
    end

     
    def my_reject(&prc)
        new_array = []

        self.my_each do |ele|
            if !prc.call(ele)
                new_array << ele
            end
        end
        
        new_array
    end

    def my_any?(&prc)
        self.my_each do |ele|
            if prc.call(ele)
                return true
            end
        end

        false
    end

    def my_all?(&prc)
        count = 0

        self.my_each do |ele|
            if prc.call(ele)
                count += 1
            end
        end

        self.length == count
    end

    def my_flatten
        flattened = []

        self.my_each do |ele|
            if ele.is_a?(Array)
                flattened.concat(ele.my_flatten)
            else
                flattened << ele
            end
        end

        flattened
    end

    def my_zip(*arrays)
        zip = []

        self.length.times do |i|
            subzip = [self[i]]

            arrays.my_each do |array|
                subzip << array[i]
            end

            zip << subzip
        end

        zip
    end

    def my_rotate(num=1)
        split = num % self.length

        self.drop(split) + self.take(split)
    end

    def my_join(separator="")
        join = ""
        i = 0

        self.my_each do |ele|
            if i == 0
                join += ele
            else
                join += (separator+ele)
            end
            i += 1
        end

        join
    end

    def my_reverse
        reversed = []
        
        self.my_each do |ele|
            reversed.unshift(ele)
        end
        
        reversed
    end

end



#my_reverse
# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]


#my_join
# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"


#my_rotate
# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]


# my_each test
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# p return_value


# my_select
# a = [1, 2, 3]
# a.my_select { |num| num > 1 } # => [2, 3]
# a.my_select { |num| num == 4 } # => []


# my_reject
# a = [1, 2, 3]
# a.my_reject { |num| num > 1 } # => [1]
# a.my_reject { |num| num == 4 } # => [1, 2, 3]


#any? and all?
# a = [1, 2, 3]
# a.my_any? { |num| num > 1 } # => true
# a.my_any? { |num| num == 4 } # => false
# a.my_all? { |num| num > 1 } # => false
# a.my_all? { |num| num < 4 } # => true


# my_flatten
# [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]


# My Zip
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
# c = [10, 11, 12]
# d = [13, 14, 15]
# [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]