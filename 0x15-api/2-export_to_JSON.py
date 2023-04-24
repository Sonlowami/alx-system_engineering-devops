#!/usr/bin/python3
"""
This module contain a script to fetch data from an API
"""
import requests
from sys import argv
import json


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
        data = []
        for task in r_json:
            task_dict = {}
            task_dict['task'] = task['title']
            task_dict['completed'] = task['completed']
            task_dict['username'] = name
            data.append(task_dict)
        with open('{}.json'.format(argv[1]), 'w') as f:
            json.dump({argv[1]: data}, f)

    except IndexError:
        pass
