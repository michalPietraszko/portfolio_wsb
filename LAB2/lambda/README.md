**Prerequisition**
- Dockerengine is running
- each new terminal has venv enabled
   ```bash
   . ./bin/activate
   ```

1. Run localstack
```bash
$ localstack start
```

2. In the separate terminal create mocked s3 bucket and transfer example.cvs 
```bash
$ ./create_bucket_sync_files.sh
```

3. Lambda is defined in run_lambda.py
For easy local run main is reading `event.json` locally, modify
`COLORS_FILE_URL=event['path']#event.get('path')` line and main to run lambda on aws