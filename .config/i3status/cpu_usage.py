#!/usr/bin/env python3
# Converts the cpu percentages in i3status json output into bars using unicode blocks.
import sys
import json

# Characters to be stripped from the usage string
_STRIP_CHARS = "% "

# Pad it out
_PADDING = ' ' * 34

# Characters to replace cpu usage with
_ONE_EIGHTH_BLOCK = '\u2581'
_ONE_QUARTER_BLOCK = '\u2582'
_THREE_EIGHTHS_BLOCK = '\u2583'
_HALF_BLOCK = '\u2584'
_FIVE_EIGHTHS_BLOCK = '\u2585'
_THREE_QUARTERS_BLOCK = '\u2586'
_SEVEN_EIGHTHS_BLOCK = '\u2587'
_FULL_BLOCK = '\u2588'

# Each character gets an equal interval of the cpu usage.
_BLOCK_INTERVAL = 1 / 8

# Map of values to render below
_BLOCK_SLICES = {
    _BLOCK_INTERVAL: _ONE_EIGHTH_BLOCK,
    _BLOCK_INTERVAL * 2: _ONE_QUARTER_BLOCK,
    _BLOCK_INTERVAL * 3: _THREE_EIGHTHS_BLOCK,
    _BLOCK_INTERVAL * 4: _HALF_BLOCK,
    _BLOCK_INTERVAL * 5: _FIVE_EIGHTHS_BLOCK,
    _BLOCK_INTERVAL * 6: _THREE_QUARTERS_BLOCK,
    _BLOCK_INTERVAL * 7: _SEVEN_EIGHTHS_BLOCK,
}


def _usage_block(usage):
    """Return the character to render for a usage value"""
    for limit, character in _BLOCK_SLICES.items():
        if usage < limit:
            return character
    return _FULL_BLOCK


def _convert_usages(usages):
    """Convert the usage string to unicode block characters."""
    return "".join([_usage_block(int(x.strip(_STRIP_CHARS)) / 100) for x in usages.split()]) + _PADDING


def _process_element(element):
    """Convert cpu_usage elements to use the unicode block characters."""
    if element['name'] == "cpu_usage":
        element['full_text'] = _convert_usages(element['full_text'])
    return element


def _update_json(string):
    """Update the json to use unicode block characters for cpu_usage"""
    leader = "," if string[0] == "," else ""
    status_array = json.loads(string.strip(",\n"))
    status_array = [_process_element(element) for element in status_array]
    return leader + json.dumps(status_array, ensure_ascii=False) + "\n"


if __name__ == "__main__":
    # We skip the first two lines because they're a protocol header and an array open.
    sys.stdout.write(sys.stdin.readline())
    sys.stdout.write(sys.stdin.readline())
    while True:
        line = sys.stdin.readline()
        processed = _update_json(line)
        sys.stdout.write(processed)
        sys.stdout.flush()
