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
    
    def my_zip(*arrays)
        zip_array = []
        self.each.with_index do |ele, i|
            sub_array = [ele]
            arrays.each do |array|
                sub_array << array[i] 
            end
            zip_array << sub_array
        end
        return zip_array
    end


    def my_rotate(rotations=1)
        rotated_array = []
        self.each {|ele| rotated_array << ele}
        if rotations > 0 
            # push (adds to end) and shift (removes from beginning)
            rotations.times {rotated_array.push(rotated_array.shift)}                
        else
            # pop (removes from end) and unshift (adds to beginning) 
            (-rotations).times {rotated_array.unshift(rotated_array.pop)}
        end
        return rotated_array
    end

    

end


a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]



