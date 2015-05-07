# Horus

tsv rotator for [Imhotep](https://github.com/indeedeng/imhotep)

Rotates all `*_horus.tsv` files to s3 hourly, using filename prefix as dataset name

run:

```bash
docker run
  --restart always
  --name horus
  -v /var/log:/var/log
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
  -e AWS_REGION=$AWS_REGION
  -e LOG_DIR=$LOG_DIR # directory to search for *_horus.tsv files
  -e BUILD_BUCKET=$BUILD_BUCKET # imhotep s3 build bucket
  -d
  -t clay/horus
```
