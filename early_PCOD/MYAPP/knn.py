import csv
import pickle
# Age,Sex,ChestPainType,RestingBP,Cholesterol,FastingBS,RestingECG,MaxHR,ExerciseAngina,Oldpeak,ST_Slope,HeartDisease
# opening the CSV file


x=[]
y=[]
with open(r'C:\Users\ismfa\PycharmProjects\pcod_detection\pcod_detectionApp\PCOS_data.csv', mode='r') as file:
    # reading the CSV file
    csvFile = csv.DictReader(file)
    print(csvFile)

    # displaying the contents of the CSV file
    for lines in csvFile:
        try:
            row=[]
            row.append(float(lines[' Age']))
            row.append(float(lines['Blood Group']))
            row.append(float(lines['Weight']))
            row.append(float(lines['Height(Cm) ']))

            row.append(float(lines['TSH (mIU/L)']))
            row.append(float(lines['AMH(ng/mL)']))
            row.append(float(lines['Vit D3 (ng/mL)']))

            row.append(float(lines['BMI']))
            row.append(float(lines['Cycle(R/I)']))
            # print(lines['Marraige Status (Yrs)'])
            row.append(float(lines['Marraige Status (Yrs)']))

            row.append(float(lines['Pregnant(Y/N)']))
            row.append(float(lines['No. of abortions']))

            row.append(float(lines['Weight gain(Y/N)']))
            row.append(float(lines['hair growth(Y/N)']))
            row.append(float(lines['Fast food (Y/N)']))

            row.append(float(lines['Skin darkening (Y/N)']))
            row.append(float(lines['Hair loss(Y/N)']))
            row.append(float(lines['Pimples(Y/N)']))
            row.append(float(lines['Reg.Exercise(Y/N)']))
            row.append(float(lines['Hip(inch)']))
            row.append(float(lines['Waist(inch)']))
            row.append(float(lines['Cycle length(days)']))

            print("okkkkk")
            x.append(row)
            y.append(float(lines['PCOS (Y/N)']))
        except Exception as e:
            print(e)
            pass
    print(len(x))
    print(len(y))



print(x[0],y[0])

from sklearn.model_selection import train_test_split

train_data, test_data, train_labels, test_labels = train_test_split(x, y)


from sklearn.neighbors import KNeighborsClassifier
model = KNeighborsClassifier(n_neighbors=1)
# Train the model using the training sets
model.fit(x,y)
filename='knn_model.sav'
pickle.dump(model,open(filename,'wb'))
#Predict Output
model=pickle.load(open(filename,'rb'))
#load model
predicted= model.predict(test_data)
print(predicted,"Using KNN")

from sklearn.metrics import classification_report

target_names = ['class 0', 'class 1']
print(classification_report(test_labels, predicted, target_names=target_names))

# def dtprediction(data):
#     filename = 'knn_model.sav'
#     model = pickle.load(open(filename, 'rb'))
#     predicted = model.predict(data)
#     return predicted
# #
# print(dtprediction([[22.0, 15.0, 23.6, 3.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 44.0, 42.0, 4.0]]))


