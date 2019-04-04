python -m torch.distributed.launch \
       --nproc_per_node=$NGPUS tools/train_net.py \
       --config-file configs/cityscapes/train_mask_rcnn_R_101_FPN_1x_coco2cityscapes.yaml

