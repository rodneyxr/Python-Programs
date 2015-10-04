DATA = (0.5, 1.1, 2.5, 3.5, 3.6, 4.0, 4.5, 4.6)  # This works
# (0.5, 1.1, 2.5, 3.5, 3.6, 4.0, 4.4, 4.5) # This does not work


def get_all_sets(L):  # Returns a List of Lists containing all possible 'maximized' unit length sets
    A = []  # List that will contain all possibile lists
    for x in range(0, len(L) - 1):
        i = x
        tmpL = []
        while i < len(L) and L[i] <= L[x] + 1:
            tmpL.append(L[i])
            i += 1
        A.append(tmpL)
    return A


def remove(R, L):  # removes elements in R from L (modifys L)
    for x in R:  # for each item in R
        L.remove(x)  # remove it from L


def alga():  # takes set with most elements and repeats
    sol = []  # Solution to return
    clist = list(DATA)  # current list from global data
    while len(clist) > 1:  # while clist has 1 item left
        A = get_all_sets(clist)  # get all possibilities from the current list
        maxi = 0  # set max index to 0
        counter = 0  # counter to keep track of the max index
        for L in A:  # for each possibility (list L) do
            if len(L) > len(A[maxi]):  # check if this list contains more items
                maxi = counter  # this is the new max index
            counter += 1  # increment the counter
        remove(A[maxi], clist)  # remove this max list from the current list
        sol.append(A[maxi])  # add this max list to the solution
    sol.append(clist)  # add the remainding list to the solution
    return sol  # return the solution


def algb():  # adds the items in [x, x + 1] to the solution and repeats
    sol = []  # solution to be returned
    L = list(DATA)  # create a list from the DATA
    i = 0
    while i < len(L):  # iterate throught he whole list until we reach the end
        tmp = []  # temporary list to be added to the solution
        x = i  # save the current index as we will be modifying i in this next while loop
        while x < len(L) and L[x] <= L[i] + 1:  # loop through the list while the item is in [x, x + 1]
            tmp.append(L[x])  # append this item to the temp list
            x += 1  # increment the index to see if the next item is in range
        i += len(tmp)
        sol.append(tmp)
    return sol

# Print the data
print("Data")
print(list(DATA))
print()

# Print Greedy Algorithm A
print("Algorithm A")
counter = 1
for L in alga():
    print("{0}: {1}".format(counter, L))
    counter += 1

print()

# Print Greedy Algorithm B
print("Algorithm B")
counter = 1
for L in algb():
    print("{0}: {1}".format(counter, L))
    counter += 1