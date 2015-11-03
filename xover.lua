#!/usr/bin/lua

--[[
@title Evolutionary operator benmarks
]]--

-- Mutate and compute time
function time_crossover (number,indi,other_indi)
   inicioTiempo = os.clock()
   for i=1,number do
      result = crossover( indi, other_indi )
   end
   return os.clock() - inicioTiempo 
end

require 'LunEO'

length = 16
iterations = 100000
top_length = 32768
repeat 
    indi = random_chromosome(length)
    other_indi = random_chromosome(length)
    print("lua-BitString, " .. length ..", ".. time_crossover( iterations, indi, other_indi ))
    length = length*2
until length > top_length



