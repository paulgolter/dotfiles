import logging.config

LOGGING = {
    "version": 1,
    "formatters": {"default": {"format": "%(levelname)8s %(name)s %(message)s"}},
    "handlers": {
        "console": {
            "class": "logging.StreamHandler",
            "formatter": "default",
            "stream": "ext://sys.stderr",
        },
    },
    "loggers": {
        "requests": {"level": "INFO"},
        "urllib3": {"level": "CRITICAL"},
        "BSP": {"level": "DEBUG"},
        "blender-kitsu": {"level": "INFO"},
    },
    "root": {
        "level": "INFO",
        "handlers": [
            "console",
        ],
    },
}

logging.config.dictConfig(LOGGING)


def register():
    pass
