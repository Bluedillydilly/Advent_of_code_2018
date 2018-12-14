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

function part_two()
    file = open("input.2")
    lines = readlines(file)
    words_1_off = []
    for word in lines
        for comp_word in lines
            if( word != comp_word && one_letter_off(word, comp_word) )
                push!( words_1_off, [[word, comp_word]] )
                @show word
            end
        end
    end
    println("One off: ", words_1_off)
    pair = words_1_off[1][1]
    println(pair)
    same_letters=[]
    for position in 1:1:length(pair[1])
        @show position
        if( pair[1][position] == pair[2][position])
            push!(same_letters, pair[1][position])
        end
    end
    println( join(same_letters) )
end

function one_letter_off( n, m )
    let_sum = 0
    if n == "" || m == ""
        return false
    end
    i = 1
    while i < length(n)
        if i<length(m) && n[i] != m[i]
            let_sum+=1
        end
        i+=1
    end
    @show [n,m, let_sum]
    return let_sum == 1
end

part_two()
