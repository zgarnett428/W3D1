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
    
    def my_reject(&prc)
        reject_arr = []
        i = 0
        while i < self.length
            if !prc.call(self[i])
                reject_arr << self[i]
            end
            i += 1
        end
        return reject_arr
    end

    def my_any?(&prc)
        i = 0
        while i < self.length
            return true if prc.call(self[i])
            i += 1
        end
        false
    end

    def my_all?(&prc)
        i = 0
        while i < self.length
            return false if !prc.call(self[i])
            i += 1
        end
        true
    end

    def my_flatten
        flattened = []

        self.each do |ele| 
            if !ele.is_a?(Array)
                flattened << ele
            else
                var = ele.my_flatten
                flattened += var
            end 
        end
        flattened
    end
    
end

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]









