# setup.py
from setuptools import setup, find_packages
import dbconn
import simple_api

setup(
    name='modules',
    version='0.1',
    packages=find_packages(),
    install_requires=[
        'Flask',
        'gunicorn',
        'pytz',
        'pyodbc'
    ]
)
