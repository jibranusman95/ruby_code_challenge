class Orderer
	def initialize(input_strings: )
		@ordered_chars = []
		@input_strings = input_strings
	end

	def determine_order
		all_chars = @input_strings.join('').split('').uniq.join('')

		(0...(@input_strings.length - 1)).each do |string_index|
			if @input_strings[string_index][0] != @input_strings[string_index + 1][0]
				@ordered_chars.push(@input_strings[string_index][0])
				@ordered_chars.push(@input_strings[string_index + 1][0]) if (string_index + 1) == @input_strings.length - 1
			else
				check_index = 1

				while @input_strings[string_index][check_index] == @input_strings[string_index + 1][check_index]
					check_index += 1
				end

				if check_index < @input_strings[string_index].length && check_index < @input_strings[string_index + 1].length
					@ordered_chars.push(@input_strings[string_index][check_index])
					@ordered_chars.push(@input_strings[string_index + 1][check_index]) if (string_index + 1) == @input_strings.length - 1
				end
			end
		end

		if all_chars.split('').sort.join('') == @ordered_chars.sort.join('')
			@ordered_chars
		else
			'Insufficient Information'
		end
	end
end
