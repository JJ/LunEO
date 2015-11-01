
local LunEO = {}

-- Create a random chromosome
function random_chromosome (length)
   chromosome = ''
   for i=1,length  do
      chromosome = chromosome .. ((math.random() >0.5) and "1" or "0") 
   end
   return chromosome
end

-- Computes maxOnes fitness
function compute_fitness (chromosome)
   ones = 0
   for i=1,chromosome:len() do 
      ones = ones + ( (chromosome:sub(i,i) == "1") and 1 or 0 )
   end
   return ones
end

-- Mutate all chromosomes in the population
function mutate1 ( chromosome )
   mutation_point = math.random( chromosome:len() )
   temp = chromosome
   mutie = temp:sub(1,mutation_point-1)
   print( "M " .. mutation_point .. " - " .. temp:sub(mutation_point,mutation_point) )
   if temp:sub(mutation_point,mutation_point) == '1'
   then 
      mutie = mutie .. '0'
   else 
      mutie = mutie .. '1'
   end

   mutie = mutie .. temp:sub(mutation_point+1,temp:len())
   return mutie
end

-- Mutate all chromosomes in the population
function mutate ( pool )
   for i=1,#pool do
      pool[i] = mutate1( pool[i] )
   end
end

-- crossover 
function crossover ( chrom1, chrom2 )
   length = chrom1:len()
   xover_point = math.floor( math.random ( length - 1 ))
   range = 1 + math.floor( math.random ( length - xover_point ) )
   new_chrom1 = chrom1:sub(1,xover_point-1)
   new_chrom2 = chrom2:sub(1,xover_point-1)
   new_chrom1 = new_chrom1 .. chrom2:sub(xover_point,xover_point+range)
   new_chrom2 = new_chrom2 .. chrom1:sub(xover_point,xover_point+range)
   new_chrom1 = new_chrom1 .. chrom1:sub(xover_point+range+1,length)
   new_chrom2 = new_chrom2 .. chrom2:sub(xover_point+range+1,length)
   return new_chrom1, new_chrom2
end

-- end
return LunEO
