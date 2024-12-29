if [ -e ~/.config/pipewire/client.conf.d/client-hifi.conf ]
then
    echo "HiFi enabled. Disabling"
    mv ~/.config/pipewire/client.conf.d/client-hifi.conf ~/.config/pipewire/client.conf.d/client-hifi.conf.disabled
    mv ~/.config/pipewire/pipewire.conf.d/pipewire-hifi.conf ~/.config/pipewire/pipewire.conf.d/pipewire-hifi.conf.disabled
else
    echo "HiFi disabled. Enabling"
    mv ~/.config/pipewire/client.conf.d/client-hifi.conf.disabled ~/.config/pipewire/client.conf.d/client-hifi.conf
    mv ~/.config/pipewire/pipewire.conf.d/pipewire-hifi.conf.disabled ~/.config/pipewire/pipewire.conf.d/pipewire-hifi.conf
fi

echo "Restarting services..."
systemctl restart --user pipewire.service pipewire-pulse.service
echo "Done."