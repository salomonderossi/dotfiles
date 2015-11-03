#!/usr/bin/env python
# -*- coding: utf-8 -*-

import logging


log = logging.getLogger(__name__)


def test():
    pass

if __name__ == '__main__':
    import signal

    logging.basicConfig(level=logging.DEBUG)
    signal.signal(signal.SIGINT, signal.SIG_DFL)

    #import cProfile
    #stats_file = "stats.prof"
    #cProfile.run("test()", stats_file)

    test()

    print("done")
