prefix = "ID"
nums = [1, 2, 3, "-", 10]

ids = [prefix +str(nums[0])]
for x in range(1, len(nums)-1):
    prev = nums[x-1]
    curr = nums[x]
    forw = nums[x+1]
    if curr == "-":
        for item in list(range(prev, forw)):
            ids.append(prefix + str(item))
        pass
    else:
        ids.append(prefix + str(curr))

ids.append(prefix + str(forw))
ids =  list(set(ids))