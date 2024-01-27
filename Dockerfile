FROM public.ecr.aws/paia-tech/pros-utils:20231121

RUN apt update && apt install -y tmux 
RUN apt-get clean autoclean
RUN apt-get autoremove --yes
RUN rm -rf /var/lib/{apt,dpkg,cache,log}/
RUN rm -rf /var/cache/apt/archives
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /workspaces

WORKDIR /workspaces
RUN git clone --recursive https://github.com/lintin528/Car_controller_2_type.git

RUN pip install --no-cache-dir torch==2.0.0 torchvision==0.15.1 torchaudio==2.0.1 --index-url https://download.pytorch.org/whl/cpu
RUN pip install --no-cache-dir pydantic matplotlib stable-baselines3 scikit-learn

CMD ["/bin/bash", "-l"]
