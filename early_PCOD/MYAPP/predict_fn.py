
import os, cv2, keras
from tensorflow.keras.models import load_model
# manipulate with numpy,load with panda
import numpy as np


# from tensorflow.keras.models import model_from_json
def read_dataset1(path):
    data_list = []
    label_list = []

    file_path = os.path.join(path)
    img = cv2.imread(file_path, cv2.IMREAD_GRAYSCALE)
    res = cv2.resize(img, (48, 48), interpolation=cv2.INTER_CUBIC)
    data_list.append(res)
    # label = dirPath.split('/')[-1]

            # label_list.remove("./training")
    return (np.asarray(data_list, dtype=np.float32))

def predict(fn):
    dataset=read_dataset1(fn)
    (mnist_row, mnist_col, mnist_color) = 48, 48, 1

    dataset = dataset.reshape(dataset.shape[0], mnist_row, mnist_col, mnist_color)
    dataset=dataset/255
    mo = load_model(r"C:\Users\Asus\Downloads\early_PCOD\early_PCOD\MYAPP\model1.h5")


    res = mo.predict_classes(dataset, verbose=0)

    print(res,"res==========")
    print(res,"res==========")
    print(type(res),"res==========")
    target_names = ['NO PCOD','PCOD DETECTED', 'INVALID','INVALID']
    ii=res[0]
    print(ii,"+++++++++++++++++")
    print(ii,"+++++++++++++++++")
    print(ii,"+++++++++++++++++")
    return target_names[ii]
# res=predict(r"C:\Users\ismfa\PycharmProjects\pcod_detection\img_0_57.jpg")
#
# print(res)