function main()
    frequency = 0
    name = Input("Enter your name: ")
    file = open( "input.txt" , "r" )
    changes = [parse(Int,x) for x in readlines( file ) if x != ""]
    sums = [0]
    new_sum = ""
    #while count( x -> x == new_sum, sums ) < 2
    while length(sums) < 2000
            new_sum = sums[end] + num
            for num in changes
            @show new_sum
            push!(sums, new_sum )
            if( count( x -> x == new_sum, sums ) > 1 )
                println("\n\n\nREPEAT\n\n\n")
                break
            end
        end
    end
end


function Input(prompt)
    print(prompt)
    readline()
end

main()
