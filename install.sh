echo "What is maximum sample rate of your sound card? Answer in number, ex. 384khz = 384000"
read sample_rate

mkdir -p ~/.config/pipewire/client.conf.d/
mkdir -p ~/.config/pipewire/pipewire.conf.d/

sed -i "/default.clock.rate/c\    default.clock.rate = $sample_rate" pipewire.conf.d/pipewire-hifi.conf
cp client.conf.d/client-hifi.conf ~/.config/pipewire/client.conf.d/client-hifi.conf.disabled
cp pipewire.conf.d/pipewire-hifi.conf ~/.config/pipewire/pipewire.conf.d/pipewire-hifi.conf.disabled

echo "Installed. Make sure to enable HiFi using switch-hifi.sh"

