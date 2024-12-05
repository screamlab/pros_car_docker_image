# 使用基礎 image
FROM ghcr.io/otischung/pros_ai_image:latest

# 更新 pip
RUN pip install --upgrade pip --no-cache-dir

# 安裝指定版本的 numpy 和 pybullet
RUN pip install "numpy<2" pybullet --no-cache-dir --root-user-action=ignore
RUN pip install urwid --no-cache-dir
# 安裝所需的 apt 包及 Drake
# RUN apt-get update && \
#     DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
#         curl \
#         ca-certificates \
#         python3-pip \
#         python3-venv && \
#     mkdir -p /opt/drake && \
#     curl -fsSL https://github.com/RobotLocomotion/drake/releases/download/v1.34.0/drake-1.34.0-jammy.tar.gz | \
#     tar -xzf - -C /opt/drake --strip-components=1 && \
#     DEBIAN_FRONTEND=noninteractive yes | /opt/drake/share/drake/setup/install_prereqs && \
#     echo 'export PYTHONPATH=/opt/drake/lib/python3.10/site-packages:${PYTHONPATH}' >> /etc/bash.bashrc && \
#     echo 'export LD_LIBRARY_PATH=/opt/drake/lib:${LD_LIBRARY_PATH}' >> /etc/bash.bashrc && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/* && \
#     # 測試 Drake 安裝
#     export PYTHONPATH=/opt/drake/lib/python3.10/site-packages:${PYTHONPATH} && \
#     export LD_LIBRARY_PATH=/opt/drake/lib:${LD_LIBRARY_PATH} && \
#     python3 -c "from pydrake.all import MultibodyPlant; print('Drake is installed and working')"
