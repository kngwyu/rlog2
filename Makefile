CUDA_AVAILABLE := $(shell command -v nvcc >/dev/null 2>&1 && echo 1 || echo 0)
PORT ?= 9999

register:
	uv run ipython kernel install --user --name=rlog2


jupyter:
	uv run jupyter lab --port=$(PORT) --no-browser


sync:
ifeq ($(CUDA_AVAILABLE),1)
	uv sync --extra=cuda12
else
	uv sync
endif
