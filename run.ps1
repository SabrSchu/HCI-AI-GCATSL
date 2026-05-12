$IMAGE_NAME = "gcatsl-repo"
$PLATFORM = "linux/amd64"

New-Item -ItemType Directory -Force -Path output2 | Out-Null

docker build --platform $PLATFORM -t $IMAGE_NAME .

docker run --platform $PLATFORM -it `
  -v "${PWD}/output:/app/output2" `
  $IMAGE_NAME `
  python source/main.py `
    --n_epoch 600 `
    --n_head 2 `
    --n_fold 5 `
    --n_node 6375 `
    --n_feature 3 `
    --learning_rate 0.005 `
    --weight_decay 0.0001 `
    --dropout 0.7 `
    --input_dir data/toy_examples/ `
    --output_dir outpu2t/ `
    --log_dir output2/