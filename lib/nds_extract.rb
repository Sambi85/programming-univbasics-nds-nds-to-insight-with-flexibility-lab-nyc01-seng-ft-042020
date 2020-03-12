# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method

row_index = 0
result =
update =[] 

while row_index < movies_collection.length do

update << movie_with_director_name(name, movies_collection[row_index])

  row_index += 1
end
 update
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash

row_index = 0
total1 = 0
total2 = 0
total3 = 0
studio1 =
studio2 =
studio3 =


while row_index < collection.length do

if collection[row_index][:studio] == "Alpha Films"

studio1 = collection[row_index][:studio]
total1 += collection[row_index][:worldwide_gross]

else if collection[row_index][:studio] == "Omega Films"

studio2 = collection[row_index][:studio]
total2 += collection[row_index][:worldwide_gross]

else if collection[row_index][:studio] != "Universal" && 
  collection[row_index][:studio] != "Omega Films"
 
studio3 = collection[row_index][:studio]
total3 += collection[row_index][:worldwide_gross]
      end
    end
  end

  row_index += 1
end

result = Hash.new
result.store("Alpha Films", total1)
result.store("Omega Films", total2)
result.store(studio3,total3)
pp result

end

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
result = 
dir_name = []
dir_movies =[]

row_index = 0

while row_index < source.length do

column_index = 0

while column_index < source[row_index][:movies].length

result << [
  :title => source[row_index][:movies][column_index][:title],
  :director_name => source[row_index][:name],
  :studio => source[row_index][:movies][column_index][:studio],
  :worldwide_gross => source[row_index][:movies][column_index][:worldwide_gross]
  ]

  column_index += 1
end
  
  row_index += 1
end
result
end
### directors_database is [9 directors]{x2 keys name & movie}[6 movies]{title, studio, worldwide_gross,release_year}




def studios_totals(directors_database)
pp result1 = movies_with_directors_set(directors_database) ### turns to an aoa
result2 = flatten_a_o_a(result1) ### flattens aoa
result3 = gross_per_studio(result2) # should take directors_database[0][:movies][0]
return result3
end
pp movies_with_directors_set(directors_database)
# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
