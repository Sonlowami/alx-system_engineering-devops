#!/usr/bin/python3
"""This module contain a script to find the top 10 hot posts
in a subreddit"""

import requests


def top_ten(sub_reddit):
    """Find top 10 posts trending in a sub reddit"""
    url = "https://www.reddit.com/r/{}/hot.json?limit=10".format(sub_reddit)
    headers = {
            "User-Agent": "Mozilla/5.0"
            }
    resp = requests.get(url, headers=headers, allow_redirects=False)
    try:
        posts = resp.json().get('data').get('children')
        [print(post.get('data').get('title')) for post in posts[:10]]
    except AttributeError:
        print("None")
