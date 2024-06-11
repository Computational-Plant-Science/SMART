#!/usr/bin/env python

import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name='smart-arabidopsis-traits',
    version='0.5.4',
    description='Extract geometric traits from top-view images of plants.',
    long_description=long_description,
    long_description_content_type="text/markdown",
    author='Suxing Liu',
    author_email='suxing.liu@uga.edu',
    license='BSD-3-Clause',
    url='https://github.com/Computational-Plant-Science/SMART',
    packages=setuptools.find_packages(),
    include_package_data=True,
    entry_points={
        'console_scripts': [
            'smart = core.cli:cli'
        ]
    },
    python_requires='>=3.6.8',
    install_requires=[
        'click',
        'psutil',
        'numpy',
        'numba==0.55.1',
        'pandas==1.4.1',
        'networkx',
        'skan',
        'tabulate',
        'imutils',
        'python-magic',
        'seaborn',
        'openpyxl',
        'opencv-python',
        'matplotlib',
        'scikit-learn',
        'scikit-image==0.19.3',
        'scikit-build',
        'scipy',
        'Pillow==10.0.1',
        'mayavi',
        'progressbar',
        'moviepy'
    ],
    setup_requires=['wheel'],
    tests_require=['pytest', 'coveralls'])
