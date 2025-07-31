docker run --rm -it \
    --runtime=nvidia \
    --gpus all \
    -e NVIDIA_VISIBLE_DEVICES=all \
    -e NVIDIA_DRIVER_CAPABILITIES=compute,utility,graphics \
    -v "$(pwd)":/app/Falcon/input:ro \
    -v /home/carlos/repositorios/mr_good_falcon/data:/app/Falcon/data:ro \
    --entrypoint "/app/Falcon/input/run_test.sh" \
    zeyinggong/robosense_socialnav:v0.5
