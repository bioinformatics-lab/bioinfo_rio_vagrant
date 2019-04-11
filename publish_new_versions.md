# How to publish newer versions of the box

Resources  
https://github.com/abhi18av/sys-admin/blob/276399251b917aeb5dd8a4286489ddcb10ab26ba/servers/biodragon.md
https://gist.github.com/wpscholar/a49594e2e2b918f4d0c4

### Halt the current running box 

vagrant halt

### Issue the output command 

vagrant package --output ITGE2017_RIO.box

### Create a new release on the web platform 

https://app.vagrantup.com/abhi18av/boxes/ITGE2017_RIO/versions/1.0.0/providers/virtualbox/edit?new=true

### Create a new token from the terminal via curl ( keep the version in mind ) 

curl 'https://vagrantcloud.com/api/v1/box/abhi18av/ITGE2017_RIO/version/1.0.0/provider/virtualbox/upload?access_token=nuZUUrYz4mcPjg.atlasv1.TAQrhudtGyycYioN1eh2A0kXb2bGAO7yrmLpgh0fHOwPvEBYyOSUhFtx9Iv0QMcBxN8' 

### Upload the new box via curl 

curl -X PUT --upload-file ITGE2017_RIO.box $OBTAINED_URL

### Verify that the upload is successful

```
curl 'https://vagrantcloud.com/api/v1/box/abhi18av/ITGE2017_RIO/version/0.0.1/provider/virtualbox?access_token=nuZUUrYz4mcPjg.atlasv1.TAQrhudtGyycYioN1eh2A0kXb2bGAO7yrmLpgh0fHOwPvEBYyOSUhFtx9Iv0QMcBxN8'
```
### Go to the web dashboard and manuall release the box
