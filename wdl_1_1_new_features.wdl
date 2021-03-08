version 1.0

workflow min_test {
  input {
    Int value1
    Float value2
  }
  output {
    # these two expressions are equivalent
    Float min1 = if value1 < value2 then value1 else value2
    Float min2 = min(value1, value2)

    # these two expressions are equivalent
    Float max1 = if value1 > value2 then value1 else value2
    Float max2 = max(value1, value2)


    # https://github.com/openwdl/wdl/blob/main/versions/1.1/SPEC.md#-pairarrayx-arrayy-unziparraypairx-y
    Array[Pair[Int, String]] int_str_arr = [(0, "hello"), (42, "goodbye")]
    Boolean is_true = unzip(int_str_arr) == ([0, 42], ["hello", "goodbye"])

    Map[String, Int] mymap = {"a": 0, "b": 1, "c": 2}
    Pair[Array[X], Pair[Array[Y]] keys_and_values = unzip(as_pairs(mymap))
    Boolean is_true2 = keys_and_values.left == ["a", "b", "c"]
    Boolean is_true3 = keys_and_values.right == [0, 1, 2]


    # https://github.com/openwdl/wdl/blob/main/versions/1.1/SPEC.md#-arraystring-quotearrayp
    Array[String] env = ["key1=value1", "key2=value2", "key3=value3"]
    Array[String] env_quoted = quote(env) # ['"key1=value1"', '"key2=value2", '"key3=value3"']

    Array[Int] env2 = [1, 2, 3]
    Array[String] env2_quoted = quote(env2) # ['"1"', '"2"', '"3"']

    #https://github.com/openwdl/wdl/blob/main/versions/1.1/SPEC.md#-arraystring-squotearrayp
    Array[String] env3 = ["key1=value1", "key2=value2", "key3=value3"]
    Array[String] env3_quoted =  squote(env3) # ["'key1=value1'", "'key2=value2'", "'key3=value3'"]

    Array[Int] env4 = [1, 2, 3]
    Array[String] env4_quoted = squote(env4) # ["'1'", "'2'", "'3'"]

  }
}
