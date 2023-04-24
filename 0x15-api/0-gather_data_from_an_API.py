#!/usr/bin/python3
"""
This module contain a script to fetch data from an API
"""
import requests
from sys import argv


if __name__ == '__main__':
    try:
        # We first get the name of the user
        r = requests.get('https://jsonplaceholder.typicode.com/users/{}'
                         .format(argv[1]))
        name = r.json()['name']

        # Then, we get data about the todos of this user
        r = requests.get('https://jsonplaceholder.typicode.com/users/{}/todos/'
                         .format(argv[1]))
        r_json = r.json()
        completed = total = 0
        done_tasks = []
        for obj in r_json:
            if obj['completed']:
                completed += 1
                done_tasks.append(obj['title'])
            total += 1
        print('Employee {} is done with tasks({}/{})'
              .format(name, completed, total))
        for task in done_tasks:
            print('\t{}'.format(task))

    except IndexError:
        pass
