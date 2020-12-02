cpdef list proceed_dict(dict input_data, int slice_length):
    cdef list results = list()
    cdef dict data, temp = dict()
    cdef int i
    cdef str data_id
    for i, (data_id, data) in enumerate(input_data.items(), start=1):
        temp.update({data_id: data})
        if i % slice_length == 0:
            results.append(temp.copy())
            temp.clear()
    if temp:
        results.append(temp)
    return results

cpdef list proceed_list(list input_data, int slice_length):
    cdef int i, l = len(input_data)//slice_length + 1
    cdef list r, results = []
    for i in range(l):
        r = input_data[l*i:l*(i+1)]
        results.append(r)
    return results

cpdef list proceed_pages(int amount, int slice_length):
    cdef list results = [], temp = []
    cdef int i, l = amount + 1
    for i in range(1, l):
        temp.append(i)
        if i % slice_length == 0:
            results.append(temp.copy())
            temp.clear()
    if temp:
        results.append(temp)
    return results
