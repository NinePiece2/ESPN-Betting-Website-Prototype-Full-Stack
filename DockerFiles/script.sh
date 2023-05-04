sudo docker build . --file Dockerfile-accountdb --tag ninepiece2/coe692_lab5:accountdb
sudo docker build . --file Dockerfile-informationdb --tag ninepiece2/coe692_lab5:informationdb
sudo docker build . --file Dockerfile-bettingdb --tag ninepiece2/coe692_lab5:bettingdb
sudo docker build . --file Dockerfile-informationservice --tag ninepiece2/coe692_lab5:informationservice
sudo docker build . --file Dockerfile-frontendservice --tag ninepiece2/coe692_lab5:frontendservice
sudo docker build . --file Dockerfile-bettingservice --tag ninepiece2/coe692_lab5:bettingservice

sudo docker push ninepiece2/coe692_lab5:accountdb
sudo docker push ninepiece2/coe692_lab5:informationdb
sudo docker push ninepiece2/coe692_lab5:bettingdb
sudo docker push ninepiece2/coe692_lab5:informationservice
sudo docker push ninepiece2/coe692_lab5:frontendservice
sudo docker push ninepiece2/coe692_lab5:bettingservice
