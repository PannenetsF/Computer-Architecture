def gold(s0, s1):
    t = []
    t.append(s0)
    t.append(s1)
    for i in range(2, 8):
        t.append(t[i-2]+t[i-1])
    for i in enumerate(t):
        print('s%d'%i, 'is ', t[i])

gold(1,2)