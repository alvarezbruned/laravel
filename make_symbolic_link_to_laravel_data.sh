#!/bin/bash
ln -s $(docker volume inspect laravel_appdata | grep "Mountpoint" | sed -e 's/        "Mountpoint": "//' | sed -e 's/",//') $PWD/data
