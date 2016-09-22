@echo off
for /f "skip=2" %%a in ('docker-compose ps') do (
    ECHO.%%a| FIND /I "_php_">Nul && (
        docker exec -i -t %%a /bin/bash
    )
)
