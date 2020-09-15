def gold(s0, s1):
    t = []
    t.append(s0)
    t.append(s1)
    for i in range(2, 8):
        t.append(t[i-2]+t[i-1])
    # print(enumerate(t))
    for i, ele in enumerate(t):
        print('s%d'%i, 'is ', ele)

gold(1,2)