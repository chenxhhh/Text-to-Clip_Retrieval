# --------------------------------------------------------
# Text-to-Clip Retrieval
# Copyright (c) 2019 Boston Univ.
# Licensed under The MIT License [see LICENSE for details]
# Written by Huijuan Xu
# --------------------------------------------------------


#export CUDA_HOME=/usr/local/cuda-7.5
#export LD_LIBRARY_PATH=${CUDA_HOME}/lib64


export PYTHONUNBUFFERED=true

GPU_ID=0
EX_DIR=train_rpn

LOG="experiments/${EX_DIR}/log.txt.`date +'%Y-%m-%d_%H-%M-%S'`"


time python ./experiments/${EX_DIR}/train_net.py --gpu ${GPU_ID} \
  --solver ./experiments/${EX_DIR}/solver.prototxt \
  --weights ./pretrain/charades_iter_25000_fps5_lrONEepoch.caffemodel \
  --cfg ./experiments/${EX_DIR}/td_cnn_end2end.yml \
  ${EXTRA_ARGS} \
  2>&1 | tee $LOG


