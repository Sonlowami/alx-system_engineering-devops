#!/usr/bin/python3
"""This script returns the number of subscribers for a
subreddit."""
import requests


def number_of_subscribers(subreddit):
    """Return the number of subscribers of a subreddit"""
    headers = {
            "User-Agent": "Mozilla/5.0"
            }
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    resp = requests.get(url, headers=headers, allow_redirects=False)
    try:
        return resp.json().get('data').get('subscribers')
    except AttributeError:
        return 0
