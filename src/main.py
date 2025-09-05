# -*- coding: utf-8 -*-
from asyncio import sleep
from random import randrange
from volgactf.final.checker.result import Result
import logging
from external import get_random_message
from aiohttp import ClientSession
import sys
import os

logger = logging.getLogger(__name__)


def ping_enabled():
    return os.getenv('VOLGACTF_FINAL_PING_ENABLED', 'yes') == 'yes'


async def ping_service(endpoint):
    async with ClientSession() as session:
        uri = 'http://{0}:{1:d}'.format(endpoint, 8080)
        try:
            async with session.head(uri) as r:
                return r.status == 200
        except Exception:
            logger.error('An exception occured', exc_info=sys.exc_info())
            return False


async def push(endpoint, capsule, label, metadata):
    delay = randrange(1, 5)
    logger.debug('Sleeping for {0} seconds...'.format(delay))
    await sleep(delay)
    if ping_enabled() and not await ping_service(endpoint):
        return Result.DOWN
    updated_label = 'LABEL__{0}'.format(get_random_message(8))
    message = 'MESSAGE__{0}'.format(get_random_message(16))
    open_data = 'OPEN_DATA__{0}'.format(get_random_message(12))
    return Result.UP, updated_label, message, open_data


async def pull(endpoint, capsule, label, metadata):
    delay = randrange(1, 5)
    logger.debug('Sleeping for {0} seconds...'.format(delay))
    await sleep(delay)
    if ping_enabled() and not await ping_service(endpoint):
        return Result.DOWN
    message = 'MESSAGE__{0}'.format(get_random_message(16))
    return Result.UP, message
