#!/usr/bin/python3
"""
This module contain a script to fetch data from an API
"""
import csv
import requests
from sys import argv


if __name__ == '__main__':
    try:
        # We first get the name of the user
        r = requests.get('https://jsonplaceholder.typicode.com/users/{}'
                         .format(argv[1]))
        name = r.json()['username']

        # Then, we get data about the todos of this user
        r = requests.get('https://jsonplaceholder.typicode.com/users/{}/todos/'
                         .format(argv[1]))
        r_json = r.json()
        with open('{}.csv'.format(argv[1]), 'w', newline='') as f:
            writer = csv.writer(f)
            for obj in r_json:
                uid = obj['userId']
                writer.writerow([uid, name, obj['completed'], obj['title']]
                                )

    except IndexError:
        pass
