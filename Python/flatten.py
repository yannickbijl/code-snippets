nested_list = [1, [2], [[3], 4], 5]

def flatten(nest_list):
    flat_list = []
    ([flat_list.extend(flatten(sub_list)) for sub_list in nest_list]
     if isinstance(nest_list, list) else flat_list.append(nest_list))
    return flat_list

flatten(nested_list)
