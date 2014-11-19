class Roulette
  def method_missing(name, *args)
    super unless %w[Bob Frank Bill].include? name
    people = name.to_s.capitalize
    number = 0 
    3.times do
      number = rand(10) + 1
      puts "#{number}..."
    end
    "#{person} got a #{number}"
  end
end

number_of = Roulette.new
puts number_of.bob
puts number_of.frank

class Roulette
  def dead_number
    number = 0
    3.times do
      number = rand(10) + 1
      puts "#{number}..."
    end
    number
  end
  
  def get_dead_number_by_name name
    number = dead_number
    puts name.capitalize + " got a #{number}"
    number
  end
end

r = Roulette.new
r.get_dead_number_by_name 'bob'
r.get_dead_number_by_name 'frank'

