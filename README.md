# Faster R-CNN and Mask R-CNN in PyTorch 1.0

This repo is forked from https://github.com/facebookresearch/maskrcnn-benchmark. See the [original README](README_old.md) file for details.
The purpose of this repo is to add/modify the original code to train and test on Cityscapes and BDD100K datasets.

## Metrics
The evaluation metrics are following original MaskRCNN paper and the original repo.
1. Average Precision ($AP$)
2. AP<sub>50</sub>: the AP with IOU = 0.5
3. $AP_{75}$: the AP with IOU = 0.75
4. $AP_{S}$: the AP in small scale
5. $AP_{M}$: the AP in median scale
6. $AP_{L}$: the AP in large scale

## Test COCO pretrained model on Cityscapes Dataset
#### Bounding Box
|   Backbone    | Train data | Test data      | EvalType | $AP$ | $AP_{50}$ | $AP_{75}$ | $AP_S$ | $AP_M$ | $AP_L$ |
|:-------------:|------------|----------------|----------|------|-----------|-----------|--------|--------|--------|
| ResNet50-FCN  | COCO       | Cityscapes val | Bbox     | 20.5 | 34.4      | 21.1      | 8.3    | 22.5   | 35.1   |
| ResNet101-FCN | COCO       | Cityscapes val | Bbox     | 21.5 | 35.2      | 21.9      | 8.09   | 24.4   | 36.3  |

#### Segmentation

|   Backbone    | Train data | Test data      | EvalType | $AP$ | $AP_{50}$ | $AP_{75}$ | $AP_S$ | $AP_M$ | $AP_L$ |
|:-------------:|------------|----------------|----------|------|-----------|-----------|--------|--------|--------|
| ResNet50-FCN  | COCO       | Cityscapes val | Mask     | 17.0 | 30.6      | 16.3      | 4.4    | 16.7   | 32.6   |
| ResNet101-FCN | COCO       | Cityscapes val | Mask     | 17.9 | 31.7      | 17.2      | 3.8    | 18.8   | 34.1   |

## Train on CityScapes Dataset
<!-- We follow the MaskRCNN paper to train the model with $COCO+fine$ dataset.  -->

Specifically we initialize the model to only classify the following classes: ["person", "car", "rider", "bicycle", "motorcycle", "bus", "truck", "traffic light", "traffic sign"]. 

Detectron provides [scripts](https://github.com/facebookresearch/Detectron/blob/master/tools/convert_coco_model_to_cityscapes.py) to convert a COCO-trained model to be ready for fine-tune on Cityscapes.

<!-- Note that when preparing the dataset, we have to convert the index of the same classes from different dataset so that they match. Also, since Cityscapes doesn't have instance level label of traffic light and traffic sign, we have to rely on COCO dataset (or BDD maybe?). -->

## Test on BDD100K dataset

## Train on BDD100K dataset