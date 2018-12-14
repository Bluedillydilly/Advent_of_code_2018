function part_one()
    file = open("input.2", "r")
    ids = readlines(file)

    repeat2 = []
    repeat3 = []

    # check for boxes with letters that repeat exactly 2x
    for string in ids
        for ch in string
            if any(x->x==2, [ let_count for let_count in count( char -> char == ch, collect(string) ) ])
                push!(repeat2, string)
            end
            if any(x->x==3, [ let_count for let_count in count( char -> char == ch, collect(string) ) ])
                push!(repeat3, string)
            end
        end
    end
    repeat2 = unique(repeat2)
    repeat3 = unique(repeat3)
    repeats = unique( vcat(repeat2, repeat3) )
    #println(repeats,length(repeats))
    one_off = []
    for string in repeats
        for i in length(string)
            for str in repeats
                if( length(str) == length(string) && string[1:i]*string[i:end] == str[0:i]*str[i:end] )
                    push!( one_off, [string, str] )
                end
            end
        end
    end
    println(repeats)
end

#println("Repeats twice: ",repeat2)
#println("Repeats thrice: ", repeat3)
#println("Size2: ",size(repeat2),"\nLength2: ", length(repeat2),"\n")
#println("Size3: ",size(repeat3),"\nLength3: ", length(repeat3),"\n")
#println("Check sum: ", length(repeat2)*length(repeat3))

function one_letter_off( n::string, m::string)
    let_sim = 0
    for i in length(n)
        if n[i] == m[i]
            let_sim+=1
        end
    end
    return let_sum == 1
end
