image_id="fd8rokphhgtsoa13iuro"  # Replace with the actual image ID
ssh_key_path="/home/c3nt/.ssh/otus.pub"  # Replace with the actual path to the SSH key

yc compute instance create \
  --name=groot \
  --zone=ru-central1-a \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --create-boot-disk image-id="$image_id" \
  --ssh-key "$ssh_key_path"
  --metadata=startup-script:sudo\ su\ -c\ \"puma\ -d\"
