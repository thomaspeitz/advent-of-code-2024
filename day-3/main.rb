regex = File.open('input').read

result = 0

regex.split("don't()").each do |b|
  beginning = true
  b.split('do()').each do |c|
    if beginning == false
      c.split('mul').each do |f|
        if f.start_with?('(')
          if f.include?(')')
            h = f[0..(f.index(')'))]

            numbers = h.tr('()','').split(',')
            if numbers.length == 2
              number_one = numbers.first.match(/^(\d)+$/)
              number_two = numbers[1].match(/^(\d)+$/)
              if number_one and number_two
                result += numbers.first.to_i * numbers[1].to_i
              end
            end
          end
        end
      end
    end
    beginning = false
  end
end

puts result
