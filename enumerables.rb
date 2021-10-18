# my-each

class Array
    def my_each(&prc)
        i = 0 
        while i < self.length
            prc.call(self[i])
            i += 1 
        end
        return self
    end

    def my_select(&prc)
        select_arr = []
        i = 0
        while i < self.length
            if prc.call(self[i])
                select_arr << self[i]
            end
            i += 1 
        end
        return select_arr
    end
            
end

a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []

