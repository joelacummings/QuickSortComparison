
function QuickSort(items, lo, high)

  if (lo < high)
    p = partition(items, lo, high)
    QuickSort(items, lo, p)
    QuickSort(items, p+1, high)
  end
end

function partition(items, lo, high)

    pivot = items[lo]
    i = lo -1
    j = high + 1

    while true

        while true
            i += 1
            if (items[i] >= pivot)
              break
            end
        end

        while true
            j -= 1
            if (items[j] <= pivot)
              break
            end
        end

        if (i >= j)
          return j
        end

        temp = items[i]
        items[i] = items[j]
        items[j] = temp

    end
end

function main()
  stdin_input = Int64[]

  for line in eachline(STDIN)
      push!(stdin_input, parse(Int64, line))
  end

  println("Entering QuickSort")
  QuickSort(stdin_input, 1, length(stdin_input))
  println("QuickSort Complete")
  print(stdin_input)
end


main()
