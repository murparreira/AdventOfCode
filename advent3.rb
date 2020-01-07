memory = [1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,10,1,19,1,19,9,23,1,23,6,27,2,27,13,31,1,10,31,35,1,10,35,39,2,39,6,43,1,43,5,47,2,10,47,51,1,5,51,55,1,55,13,59,1,59,9,63,2,9,63,67,1,6,67,71,1,71,13,75,1,75,10,79,1,5,79,83,1,10,83,87,1,5,87,91,1,91,9,95,2,13,95,99,1,5,99,103,2,103,9,107,1,5,107,111,2,111,9,115,1,115,6,119,2,13,119,123,1,123,5,127,1,127,9,131,1,131,10,135,1,13,135,139,2,9,139,143,1,5,143,147,1,13,147,151,1,151,2,155,1,10,155,0,99,2,14,0,0]

def restore_gravity_assist memory
  memory[1] = 12
  memory[2] = 2
  memory
end

def get_opcode number
  case number
  when 1
    "+"
  when 2
    "*"
  when 99
    "HALT"
  end
end

def perform_instruction opcode, i, memory  
  parameter_one_position = memory[i + 1]
  parameter_two_position = memory[i + 2]
  instruction_result_position = memory[i + 3]
  parameter_one = memory[parameter_one_position]
  parameter_two = memory[parameter_two_position]
  puts "First parameter is now #{parameter_one} from position #{parameter_one_position}"
  puts "Second parameter is now #{parameter_two} from position #{parameter_two_position}"  
  instruction_result = memory[parameter_one_position].send("#{opcode}", memory[parameter_two_position])
  puts "Instruction result is now: #{instruction_result} to replace position #{instruction_result_position}"
  memory[instruction_result_position] = instruction_result
  puts "Input after instruction is now: #{memory}"
  memory
end

def parse_memory memory
  puts "Initial memory is: #{memory}"
  i = 0
  loop do
    opcode = get_opcode memory[i]
    puts "Operation is now: #{opcode}"
    break if opcode == "HALT"
    memory = perform_instruction opcode, i, memory    
    i += 4
    puts "New array position is now: #{i}"
  end
  memory
end


memory = restore_gravity_assist memory
memory = parse_memory memory

puts "Memory is now #{memory}"
puts "The first element is #{memory[0]}"
