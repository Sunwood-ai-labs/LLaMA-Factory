FROM nvcr.io/nvidia/pytorch:22.10-py3

# -------------------------------------
# init
#
RUN python3 -m pip install --upgrade pip
WORKDIR /Factory
ENV FORCE_CUDA=1
ENV MMCV_WITH_OPS=1

RUN apt-get update
RUN apt-get install -y libgl1-mesa-dev

# -------------------------------------
# LLaMA-Factory setup
#
COPY . ./
RUN pip install -r requirements.txt
RUN pip install bitsandbytes