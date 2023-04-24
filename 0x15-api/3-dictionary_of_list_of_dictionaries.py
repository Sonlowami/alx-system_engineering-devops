#!/usr/bin/python3
"""
This module contain a script to fetch data from an API
"""
import requests
import json


if __name__ == '__main__':
    result_dict = {}
    # We first get all users in json
    r = requests.get('https://jsonplaceholder.typicode.com/users/')
    for user in r.json():
        idt, name = user['id'], user['name']

        # Then, we get data for every user in the list
        r = requests.get('https://jsonplaceholder.typicode.com/users/{}/todos/'
                         .format(idt))
        r_json = r.json()
        data = []
        for task in r_json:
            task_dict = {}
            task_dict['task'] = task['title']
            task_dict['completed'] = task['completed']
            task_dict['username'] = name
            data.append(task_dict)
        result_dict[idt] = data
    with open('todo_all_employees.json', 'w') as f:
        json.dump(result_dict, f)
