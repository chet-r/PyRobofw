"""
    Qase.io API

    Listener of QASE Test Management System.
    When used, it creates a new test run & marks each
    test with the test status at the end of test execution.
    User is require to pass the arguments to the listener like shown below
    e.g: robot --listener "QaseListener.py:<api_token>:<project_code>:<Name of the test run>:<testplan_id>" .\<some-test.robot>
"""

import requests


class QaseListener:
    ROBOT_LISTENER_API_VERSION = 3

    def __init__(self, api_token, project_id, run_name, testplan_id):
        self.api_token = api_token
        self.project_id = project_id
        self.run_id = None
        self.run_name = run_name
        self.testplan_id = testplan_id

    def start_suite(self, data, result):
        data = {
            "title": self.run_name,
            "description": "Test run from automation",
            "include_all_cases": False,
            "plan_id": self.testplan_id
        }
        headers = {
            "accept": "application/json",
            "content-type": "application/json",
            "Token": self.api_token
        }
        url = 'https://api.qase.io/v1/run/{}'.format(self.project_id)
        response = requests.post(url, json=data, headers=headers).json()
        self.run_id = response['result']['id']

    def end_test(self, test, result):
        test_name = str(test.longname).split('-')[1]
        case_id = int(test_name)
        if result.status == "PASS":
            res = "passed"
        elif result.status == "FAIL":
            res = "failed"
        else:
            res = "skipped"

        data = {"results": [
            {
                "status": res,
                "case_id": case_id
            }
        ]}
        headers = {
            "accept": "application/json",
            "content-type": "application/json",
            "Token": self.api_token
        }
        url = 'https://api.qase.io/v1/result/{}/{}/bulk'.format(self.project_id, self.run_id)
        response = requests.post(url, json=data, headers=headers)

    def end_suite(self, data, result):
        url = "https://api.qase.io/v1/run/DEMO/{}/complete".format(self.run_id)

        headers = {
            "accept": "application/json",
            "Token": self.api_token
        }
        requests.post(url, headers=headers)
