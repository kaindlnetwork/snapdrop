FROM lscr.io/linuxserver/snapdrop:latest

# Add Healthcheck into the Image
# Maximum Retries are 5 times according to  CIS Docker Benchmark 1.4.0 aka Best Practices
HEALTHCHECK --interval=30s --timeout=3s --retries=5 --start-period=10s \
  CMD code_http=$(curl -sI -o /dev/null -w %{http_code} http://localhost:80); if [ $code_http != 200 ];then exit 1;else exit 0; fi
