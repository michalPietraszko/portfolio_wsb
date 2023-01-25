import logging

# Zalaczam tez moj logger w projekcie c++
# https://github.com/michalPietraszko/Demo-Sensor-Network/blob/master/src/environment/LogService.hpp

LOGGING_FORMAT = '%(levelname)s — %(message)s'


def getLogger(minLoggingLevel):
    logger = logging.getLogger('Name')
    logging.basicConfig(format=LOGGING_FORMAT, level=minLoggingLevel)

    return logger


globalLogger = getLogger(logging.INFO)


def getLoggingFn(level):
    if level == logging.DEBUG:
        return globalLogger.debug
    if level == logging.INFO:
        return globalLogger.info
    if level == logging.WARNING:
        return globalLogger.warning
    if level == logging.ERROR:
        return globalLogger.error
    return globalLogger.critical


def log(level, message):
    getLoggingFn(level)(message)


log(logging.INFO, "this is won't show due to logging level DEBUG")
log(logging.DEBUG, "this is debug")
log(logging.CRITICAL, "this is critical")

