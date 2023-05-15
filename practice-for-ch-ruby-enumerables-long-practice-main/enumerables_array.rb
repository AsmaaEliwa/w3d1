require "byebug"
class Array
def my_each(&prc)
i=0
while i< self.length
prc.call(self[i])
  i+=1 
end
self
end

def my_select(&prc)
  selected_ele=[]
  
 self.my_each do |ele|
  if prc.call(ele)
    selected_ele<<ele
end
end
  selected_ele
end

def my_reject(&prc)
  selected_ele=[]
 self.my_each do |ele|
if ! prc.call(ele)
  selected_ele<<ele
end
end
selected_ele
end


def my_any?(&prc)
  if self.my_select(&prc).length>0
    return true
  else
    return false
  end
end


def my_all? (&prc)
  if self.my_select(&prc).length==self.length
    return true
  else
    return false
  end
end

def my_flatten(flatten_arr=[])
  self.my_each do |ele|
    if !ele.is_a? Array 
      # debugger
      flatten_arr<< ele
else
  ele.my_flatten(flatten_arr)
end
end
flatten_arr
end

def my_zip(*arrays)
  new_arr=self.map {|ele| [ele]}
  arrays.my_each do  |arr|
    arr.my_each do |ele|
      ele_index=arr.index(ele)
      if ele_index>new_arr.length-1
      new_arr<<[ele]
      else
      new_arr[ele_index]<<ele
      end
    end
  end
  new_arr
end



def my_rotate(n=1)
  # debugger

  if n>0
    n.times do 
      shifted_ele=self.shift()
      self.push(shifted_ele)
    end
  end

  if n < 0
# debugger

    (-n).times do 

      shifted_ele=self.pop()
      self.unshift(shifted_ele)
    end
  end
self
end



def my_join(sep="")
  string=""
  self.my_each do |ele|
    string+=ele
if self.index(ele) !=self.length-1
  string+=sep
end
end
string
end 



def my_reverse
  arr=[]
i=self.length-1
while i>=0
arr<<self[i]
i-=1
end
arr
end



end

# p [1, 2, 3].my_each{ |el| puts el }
# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []


# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]


# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false

# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]


# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# a = [ "a", "b", "c", "d" ]

# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# a = [ "a", "b", "c", "d" ]

# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# a = [ "a", "b", "c", "d" ]

# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]



# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse     