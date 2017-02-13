@echo off
for /f "skip=2" %%a in ('docker-compose ps') do (
    ECHO.%%a| FIND /I "_app_">Nul && (
        docker exec -i -t %%a /bin/bash
    )
)
