# https://www.kaggle.com/code/venkatkumar001/yoga-pose-recognition-mediapipe/notebook

import math
import cv2
import numpy as np
from time import time
import mediapipe as mp
# import matplotlib.pyplot as plt
# from IPython.display import HTML

mp_pose = mp.solutions.pose
# Setting up the Pose function.
# , model_complexity=2
pose = mp_pose.Pose(static_image_mode=True, min_detection_confidence=0.3)

# Initializing mediapipe drawing class, useful for annotation.
mp_drawing = mp.solutions.drawing_utils

#Input_Image
# sample_img  = cv2.imread('treepose1.jpg')
# plt.figure(figsize = [10,10])
# plt.title("sample_Image");plt.axis('off');plt.imshow(sample_img[:,:,::-1]);plt.show()

# results = pose.process(cv2.cvtColor(sample_img, cv2.COLOR_BGR2RGB))
#
# # Check if any landmarks are found.
# if results.pose_landmarks:
#
#     # Iterate two times as we only want to display first two landmarks.
#     for i in range(2):
#         # Display the found normalized landmarks.
#         #print(f'{mp_pose.PoseLandmark(i).name}:\n{results.pose_landmarks.landmark[mp_pose.PoseLandmark(i).value]}')
# # Create a copy of the sample image to draw landmarks on.
# img_copy = sample_img.copy()

# Check if any landmarks are found.
# if results.pose_landmarks:
#     # Draw Pose landmarks on the sample image.
#     mp_drawing.draw_landmarks(image=img_copy, landmark_list=results.pose_landmarks,
#                               connections=mp_pose.POSE_CONNECTIONS)
#
#     # Specify a size of the figure.
#     fig = plt.figure(figsize=[10, 10])
#
#     # Display the output image with the landmarks drawn, also convert BGR to RGB for display.
#     plt.title("Output");
#     plt.axis('off');
#     plt.imshow(img_copy[:, :, ::-1]);
#     plt.show()

# mp_drawing.plot_landmarks(results.pose_world_landmarks, mp_pose.POSE_CONNECTIONS)


def detectPose(image, pose, display=True):
    '''
    This function performs pose detection on an image.
    Args:
        image: The input image with a prominent person whose pose landmarks needs to be detected.
        pose: The pose setup function required to perform the pose detection.
        display: A boolean value that is if set to true the function displays the original input image, the resultant image,
                 and the pose landmarks in 3D plot and returns nothing.
    Returns:
        output_image: The input image with the detected pose landmarks drawn.
        landmarks: A list of detected landmarks converted into their original scale.
    '''

    # Create a copy of the input image.
    output_image = image.copy()

    # Convert the image from BGR into RGB format.
    imageRGB = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

    # Perform the Pose Detection.
    results = pose.process(imageRGB)

    # Retrieve the height and width of the input image.
    height, width, _ = image.shape

    # Initialize a list to store the detected landmarks.
    landmarks = []

    # Check if any landmarks are detected.
    if results.pose_landmarks:

        # Draw Pose landmarks on the output image.
        mp_drawing.draw_landmarks(image=output_image, landmark_list=results.pose_landmarks,
                                  connections=mp_pose.POSE_CONNECTIONS)

        # Iterate over the detected landmarks.
        for landmark in results.pose_landmarks.landmark:
            # Append the landmark into the list.
            landmarks.append((int(landmark.x * width), int(landmark.y * height),
                              (landmark.z * width)))

    # Check if the original input image and the resultant image are specified to be displayed.
    if display:

        # Display the original input image and the resultant image.
        # plt.figure(figsize=[22, 22])
        # plt.subplot(121);
        # plt.imshow(image[:, :, ::-1]);
        # plt.title("Original Image");
        # plt.axis('off');
        # plt.subplot(122);
        # plt.imshow(output_image[:, :, ::-1]);
        # plt.title("Output Image");
        # plt.axis('off');
        pass

        # Also Plot the Pose landmarks in 3D.
        # mp_drawing.plot_landmarks(results.pose_world_landmarks, mp_pose.POSE_CONNECTIONS)

    # Otherwise
    else:

        # Return the output image and the found landmarks.
        return output_image, landmarks
# Read another sample image and perform pose detection on it.
# image = cv2.imread('unknown.jpg')
# detectPose(image, pose, display=True)


def calculateAngle(landmark1, landmark2, landmark3):
    '''
    This function calculates angle between three different landmarks.
    Args:
        landmark1: The first landmark containing the x,y and z coordinates.
        landmark2: The second landmark containing the x,y and z coordinates.
        landmark3: The third landmark containing the x,y and z coordinates.
    Returns:
        angle: The calculated angle between the three landmarks.

    '''

    # Get the required landmarks coordinates.
    x1, y1, _ = landmark1
    x2, y2, _ = landmark2
    x3, y3, _ = landmark3

    # Calculate the angle between the three points
    angle = math.degrees(math.atan2(y3 - y2, x3 - x2) - math.atan2(y1 - y2, x1 - x2))

    # Check if the angle is less than zero.
    if angle < 0:
        # Add 360 to the found angle.
        angle += 360

    # Return the calculated angle.
    return angle


def classifyPose(landmarks, output_image, display=False):
    '''
    This function classifies yoga poses depending upon the angles of various body joints.
    Args:
        landmarks: A list of detected landmarks of the person whose pose needs to be classified.
        output_image: A image of the person with the detected pose landmarks drawn.
        display: A boolean value that is if set to true the function displays the resultant image with the pose label
        written on it and returns nothing.
    Returns:
        output_image: The image with the detected pose landmarks drawn and pose label written.
        label: The classified pose label of the person in the output_image.

    '''

    # Initialize the label of the pose. It is not known at this stage.
    label = 'Unknown Pose'

    # Specify the color (Red) with which the label will be written on the image.
    color = (0, 0, 255)

    # Calculate the required angles.
    # ----------------------------------------------------------------------------------------------------------------

    # Get the angle between the left shoulder, elbow and wrist points.
    left_elbow_angle = calculateAngle(landmarks[mp_pose.PoseLandmark.LEFT_SHOULDER.value],
                                      landmarks[mp_pose.PoseLandmark.LEFT_ELBOW.value],
                                      landmarks[mp_pose.PoseLandmark.LEFT_WRIST.value])

    # Get the angle between the right shoulder, elbow and wrist points.
    right_elbow_angle = calculateAngle(landmarks[mp_pose.PoseLandmark.RIGHT_SHOULDER.value],
                                       landmarks[mp_pose.PoseLandmark.RIGHT_ELBOW.value],
                                       landmarks[mp_pose.PoseLandmark.RIGHT_WRIST.value])

    # Get the angle between the left elbow, shoulder and hip points.
    left_shoulder_angle = calculateAngle(landmarks[mp_pose.PoseLandmark.LEFT_ELBOW.value],
                                         landmarks[mp_pose.PoseLandmark.LEFT_SHOULDER.value],
                                         landmarks[mp_pose.PoseLandmark.LEFT_HIP.value])

    # Get the angle between the right hip, shoulder and elbow points.
    right_shoulder_angle = calculateAngle(landmarks[mp_pose.PoseLandmark.RIGHT_HIP.value],
                                          landmarks[mp_pose.PoseLandmark.RIGHT_SHOULDER.value],
                                          landmarks[mp_pose.PoseLandmark.RIGHT_ELBOW.value])

    # Get the angle between the left hip, knee and ankle points.
    left_knee_angle = calculateAngle(landmarks[mp_pose.PoseLandmark.LEFT_HIP.value],
                                     landmarks[mp_pose.PoseLandmark.LEFT_KNEE.value],
                                     landmarks[mp_pose.PoseLandmark.LEFT_ANKLE.value])

    # Get the angle between the right hip, knee and ankle points
    right_knee_angle = calculateAngle(landmarks[mp_pose.PoseLandmark.RIGHT_HIP.value],
                                      landmarks[mp_pose.PoseLandmark.RIGHT_KNEE.value],
                                      landmarks[mp_pose.PoseLandmark.RIGHT_ANKLE.value])

    # ----------------------------------------------------------------------------------------------------------------

    # Check if it is the warrior II pose or the T pose.
    # As for both of them, both arms should be straight and shoulders should be at the specific angle.
    # ----------------------------------------------------------------------------------------------------------------
    # print (
    # "left_elbow_angle,left_shoulder_angle,left_knee_angle,right_elbow_angle,right_shoulder_angle,right_knee_angle")
    print (left_elbow_angle, "====", left_shoulder_angle, "====", left_knee_angle, "====", right_elbow_angle, "====",
           right_shoulder_angle, "====", right_knee_angle)

    # Check if the both arms are straight.
    if left_elbow_angle > 165 and left_elbow_angle < 195 and right_elbow_angle > 165 and right_elbow_angle < 195:

        # Check if shoulders are at the required angle.
        if left_shoulder_angle > 80 and left_shoulder_angle < 110 and right_shoulder_angle > 80 and right_shoulder_angle < 110:

            # Check if it is the warrior II pose.
            # ----------------------------------------------------------------------------------------------------------------

            # Check if one leg is straight.
            if left_knee_angle > 165 and left_knee_angle < 195 or right_knee_angle > 165 and right_knee_angle < 195:

                # Check if the other leg is bended at the required angle.
                if left_knee_angle > 90 and left_knee_angle < 120 or right_knee_angle > 90 and right_knee_angle < 120:
                    # Specify the label of the pose that is Warrior II pose.
                    label = 'Warrior II Pose'

                    # ----------------------------------------------------------------------------------------------------------------

                    # Check if it is the T pose.
                    # ----------------------------------------------------------------------------------------------------------------

            # Check if both legs are straight
            if left_knee_angle > 160 and left_knee_angle < 195 and right_knee_angle > 160 and right_knee_angle < 195:
                # Specify the label of the pose that is tree pose.
                label = 'T Pose'

    # ----------------------------------------------------------------------------------------------------------------

    # Check if it is the tree pose.
    # ----------------------------------------------------------------------------------------------------------------

    # Check if one leg is straight
    if left_knee_angle > 165 and left_knee_angle < 195 or right_knee_angle > 165 and right_knee_angle < 195:

        # Check if the other leg is bended at the required angle.
        if left_knee_angle > 315 and left_knee_angle < 335 or right_knee_angle > 25 and right_knee_angle < 45:
            # Specify the label of the pose that is tree pose.
            label = 'Tree Pose'

    # ----------------------------------------------------------------------------------------------------------------
    # if (left_elbow_angle > 160 and left_elbow_angle < 200) and (right_elbow_angle > 305 and right_elbow_angle < 330):
    #     # Specify the label of the pose that is tree pose.
    #     label = 'Sleeping Vishnu Pose'
    # Check if the pose is classified successfully
    if left_elbow_angle > 140 and left_elbow_angle < 155 and right_elbow_angle > 140 and right_elbow_angle < 160:

        # Check if shoulders are at the required angle.
        if left_shoulder_angle > 70 and left_shoulder_angle < 106 and right_shoulder_angle > 270 and right_shoulder_angle < 290:

            # Check if it is the warrior II pose.
            # ----------------------------------------------------------------------------------------------------------------

            # Check if one leg is straight.
            if left_knee_angle > 300 and left_knee_angle < 320 or right_knee_angle > 310 and right_knee_angle < 330:

               label = 'crane pose'

    #
    # if left_elbow_angle > 65 and left_elbow_angle < 100 and right_elbow_angle > 80 and right_elbow_angle < 100:
    #
    #     # Check if shoulders are at the required angle.
    #     if left_shoulder_angle > 175 and left_shoulder_angle < 215 and right_shoulder_angle > 150 and right_shoulder_angle < 175:
    #
    #         # Check if it is the warrior II pose.
    #         # ----------------------------------------------------------------------------------------------------------------
    #
    #         # Check if one leg is straight.
    #         if left_knee_angle > 190 and left_knee_angle < 260 or right_knee_angle > 195 and right_knee_angle < 230:
    #
    #            label = 'two-legged inverted staff pose'
    #
    # if left_elbow_angle > 190 and left_elbow_angle < 270 and right_elbow_angle > 190 and right_elbow_angle < 290:
    #
    #     # Check if shoulders are at the required angle.
    #     if left_shoulder_angle > 270 and left_shoulder_angle < 350 and right_shoulder_angle > 10 and right_shoulder_angle < 70:
    #
    #         # Check if it is the warrior II pose.
    #         # ----------------------------------------------------------------------------------------------------------------
    #
    #         # Check if one leg is straight.
    #         if left_knee_angle > 160 and left_knee_angle < 190 and right_knee_angle > 160 and right_knee_angle < 190:
    #
    #            label = 'Sphinx Pose'
    if left_elbow_angle > 90 and left_elbow_angle < 125 and right_elbow_angle > 50 and right_elbow_angle < 80:

        # Check if shoulders are at the required angle.
        if left_shoulder_angle > 300  and left_shoulder_angle < 350 and right_shoulder_angle > 50 and right_shoulder_angle < 80:

            # Check if it is the warrior II pose.
            # ----------------------------------------------------------------------------------------------------------------

            # Check if one leg is straight.
            if left_knee_angle > 180 and left_knee_angle < 260 or right_knee_angle > 180 and right_knee_angle < 240:

               label = 'supported shoulder stand pose'
    if left_elbow_angle > 100 and left_elbow_angle < 170 and right_elbow_angle > 160 and right_elbow_angle < 220:

        # Check if shoulders are at the required angle.
        if left_shoulder_angle > 10  and left_shoulder_angle < 50 and right_shoulder_angle > 0 and right_shoulder_angle < 30:

            # Check if it is the warrior II pose.
            # ----------------------------------------------------------------------------------------------------------------

            # Check if one leg is straight.
            if left_knee_angle > 300 and left_knee_angle < 360 or right_knee_angle > 0 and right_knee_angle < 30:

               label = 'cross-legged'

    if left_elbow_angle > 140 and left_elbow_angle < 170 and right_elbow_angle > 140 and right_elbow_angle < 170:

        # Check if shoulders are at the required angle.
        if left_shoulder_angle > 130 and left_shoulder_angle < 180 and right_shoulder_angle > 180 and right_shoulder_angle < 210:

            # Check if it is the warrior II pose.
            # ----------------------------------------------------------------------------------------------------------------

            # Check if one leg is straight.
            if left_knee_angle > 170 and left_knee_angle < 180 or right_knee_angle > 170 and right_knee_angle < 200:
                label = 'upward salute'
    # if left_elbow_angle > 200 and left_elbow_angle < 300 and right_elbow_angle > 190 and right_elbow_angle < 270:
    #
    #     # Check if shoulders are at the required angle.
    #     if left_shoulder_angle > 200 and left_shoulder_angle < 300 and right_shoulder_angle > 50 and right_shoulder_angle < 150:
    #
    #         # Check if it is the warrior II pose.
    #         # ----------------------------------------------------------------------------------------------------------------
    #
    #         # Check if one leg is straight.
    #         if left_knee_angle > 90 and left_knee_angle < 200 or right_knee_angle > 150 and right_knee_angle < 200:
    #             label = 'one foot expanding upward pose'

    # if left_elbow_angle > 70 and left_elbow_angle < 200 and right_elbow_angle > 150 and right_elbow_angle < 300:
    #
    #         # Check if shoulders are at the required angle.
    #         if left_shoulder_angle > 40 and left_shoulder_angle < 90 and right_shoulder_angle > 140 and right_shoulder_angle < 310:
    #
    #             # Check if it is the warrior II pose.
    #             # ----------------------------------------------------------------------------------------------------------------
    #
    #             # Check if one leg is straight.
    #             if left_knee_angle > 170 and left_knee_angle < 300 or right_knee_angle > 220 and right_knee_angle < 280:
    #                 label = 'Happy Baby Pose'
    if left_elbow_angle > 162 and left_elbow_angle < 170 and right_elbow_angle > 169 and right_elbow_angle < 179:

            # Check if shoulders are at the required angle.
            if left_shoulder_angle > 350 and left_shoulder_angle < 360 and right_shoulder_angle > 352 and right_shoulder_angle < 360:

                # Check if it is the warrior II pose.
                # ----------------------------------------------------------------------------------------------------------------

                # Check if one leg is straight.
                if left_knee_angle > 172 and left_knee_angle < 181 or right_knee_angle > 182 and right_knee_angle < 189:
                    label = 'Mountain Pose'
    if left_elbow_angle > 185 and left_elbow_angle < 200 and right_elbow_angle > 186 and right_elbow_angle < 196:

            # Check if shoulders are at the required angle.
            if left_shoulder_angle > 158 and left_shoulder_angle < 167 and right_shoulder_angle > 190 and right_shoulder_angle < 200:

                # Check if it is the warrior II pose.
                # ----------------------------------------------------------------------------------------------------------------

                # Check if one leg is straight.
                if left_knee_angle > 98 and left_knee_angle < 105 or right_knee_angle > 124 and right_knee_angle < 134:
                    label = 'chair pose'
    if left_elbow_angle > 188 and left_elbow_angle < 192 and right_elbow_angle > 177 and right_elbow_angle < 187:

        # Check if shoulders are at the required angle.
        if left_shoulder_angle > 255 and left_shoulder_angle < 265 and right_shoulder_angle > 106 and right_shoulder_angle < 120:

            # Check if it is the warrior II pose.
            # ----------------------------------------------------------------------------------------------------------------

            # Check if one leg is straight.
            if left_knee_angle > 148 and left_knee_angle < 158 or right_knee_angle > 150 and right_knee_angle < 160:
                label = 'standing forward bend pose'
    if left_elbow_angle > 198 and left_elbow_angle < 208 and right_elbow_angle > 192 and right_elbow_angle < 200:

        # Check if shoulders are at the required angle.
        if left_shoulder_angle > 298 and left_shoulder_angle < 308 and right_shoulder_angle > 65 and right_shoulder_angle < 75:

            # Check if it is the warrior II pose.
            # ----------------------------------------------------------------------------------------------------------------

            # Check if one leg is straight.
            if left_knee_angle > 179 and left_knee_angle < 185 or right_knee_angle > 173 and right_knee_angle < 180:
                label = 'plank pose'
    if left_elbow_angle > 222 and left_elbow_angle < 230 and right_elbow_angle > 220 and right_elbow_angle < 230:

        # Check if shoulders are at the required angle.
        if left_shoulder_angle > 326 and left_shoulder_angle < 336 and right_shoulder_angle > 38 and right_shoulder_angle < 48:

            # Check if it is the warrior II pose.
            # ----------------------------------------------------------------------------------------------------------------

            # Check if one leg is straight.
            if left_knee_angle > 150 and left_knee_angle < 165 or right_knee_angle > 157 and right_knee_angle < 170:
                label = 'cobra pose'
    if label != 'Unknown Pose':
        # Update the color (to green) with which the label will be written on the image.
        color = (0, 0, 255)

        # Write the label on the output image.
    cv2.putText(output_image, label, (15, 20), cv2.FONT_HERSHEY_PLAIN, 1.5, color, 1)
    #print("label",label)
    # Check if the resultant image is specified to be displayed.
    # if display:
    cv2.imwrite("static/img/output.jpg",output_image)

        # Display the resultant image.
    # plt.figure(figsize=[10, 10])
    # plt.imshow(output_image[:, :, ::-1]);
    # plt.title("Output Image");
    # plt.axis('off');

    # else:

        # Return the output image and the classified label.
    return output_image, label

def maincode(path):
    image = cv2.imread(path)
    output_image, landmarks = detectPose(image, pose, display=False)
    # print(landmarks,"++++++++++++++==========")
    if landmarks:
        #print("000olllllkkkkkkk")
        oi,lab=classifyPose(landmarks, output_image, display=True)
        #print(oi,lab)
        cv2.imwrite("output.jpg",oi)
        return lab
    else:
        return "na"
# #print(maincode(r"C:\Users\HUAWEI D15\PycharmProjects\yoga poster\src\warriorIIpose1.jpg"))
# image = cv2.imread('Tpose1.jpg')
# output_image, landmarks = detectPose(image, pose, display=False)
# if landmarks:
#     classifyPose(landmarks, output_image, display=True)

