import pymysql
from sklearn.tree import DecisionTreeClassifier

# Define your data
X = [[1, 0, 1], [1, 1, 1], [0, 1, 0], [0, 0, 1], [1, 1, 0]]
Y = ['A', 'A', 'B', 'B', 'A']

# Create the decision tree classifier
clf = DecisionTreeClassifier()

# Train the model on your data
clf.fit(X, Y)

# Define user input
user_input = [[0, 1, 1]]

# Use the trained model to make recommendations
recommendation = clf.predict(user_input)
# con = pymysql.connect(host='localhost', port=3306, user='root', password='Affru@123', db='recomendation')
# cmd = con.cursor()
def selectall(qry):
    con=pymysql.connect(host='localhost',port=3308,user='root',password='123456789',db='early_pcod')
    cmd=con.cursor()
    cmd.execute(qry)
    res=cmd.fetchall()
    return res
def selectone(qry):
    con=pymysql.connect(host='localhost',port=3308,user='root',password='123456789',db='early_pcod')
    cmd=con.cursor()
    cmd.execute(qry)
    res=cmd.fetchone()
    return res
# Print the recommendation
print('We recommend:', recommendation[0])
from scipy import spatial
def recommendor(id):
    stuentid=id
    # qq="select * from hreview_user where `lid_id`="+str(stuentid)
    # qq="SELECT * FROM `myapp_parents_table` WHERE `LOGIN_id`="+str(stuentid)
    qq="SELECT * FROM `myapp_user` WHERE `LOGIN_id`="+str(stuentid)
    ss=selectone(qq)
    # q="select * from hreview_hotel"
    q="select * from `myapp_doctor`"
    rescrs=selectall(q)
    crslist = []
    for i in rescrs:
        crslist.append(str(i[0]))
    # q2="select * from hreview_user where `lid_id`!="+str(stuentid)
    q2="SELECT * FROM `myapp_user` WHERE `LOGIN_id`!="+str(stuentid)
    resusers=selectall(q2)

    dataset=[]
    for i in resusers:
        row=[]
        crsrow=[]
        # qry="SELECT `hid_id` FROM `hreview_feedbacks` WHERE `uid_id`="+str(i[0])
        qry="SELECT `DOCTOR_ID_id` FROM `myapp_review` WHERE `USER_id`="+str(i[0])
        crssele=selectall(qry)
        for ii in crssele:
            crsrow.append(str(ii[0]))
        for ii in crslist:
            if ii in crsrow:
                row.append(1)
            else:
                row.append(0)
        dataset.append(row)
    # qry = "SELECT `hid_id` FROM `hreview_feedbacks` WHERE `uid_id`=" + str(i[0])
    qry = "SELECT `DOCTOR_ID_id` FROM `myapp_review` WHERE `USER_id`=" + str(i[0])
    crssele = selectall(qry)
    crsrow=[]
    row=[]
    for ii in crssele:
        crsrow.append(str(ii[0]))
    mydoc=[]
    for ii in crslist:
        if ii in crsrow:
            row.append(1)
            mydoc.append(ii)
        else:
            row.append(0)
    print(row)
    # dataset.append(row)
    print(dataset)
    distributions = []
    for i in range(0,len(dataset)):
        sd=spatial.distance.euclidean(row,dataset[i])
        # print(sd)
        # print(i,resusers[i])
        distributions.append([sd, resusers[i][0]])
    results = [i[1] for i in sorted(distributions)[:3]]
    print(distributions)
    print(results)
    lis=[]
    for i in results:
        lis.append(str(i))
    result1=[]
    for i in lis:
        qry = "SELECT `DOCTOR_ID_id` FROM `myapp_review` WHERE `USER_id`=" + str(i)
        crssele = selectall(qry)
        for ii in crssele:
            if ii[0] not in mydoc:
                if str(ii[0]) not in result1:
                    result1.append(str(ii[0]))
            crsrow.append(str(ii[0]))
    result=','.join(result1)
    print(result)
    return result
