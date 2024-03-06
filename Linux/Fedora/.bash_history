fm
ls
ll
convert
ll
convert Piece_Identite.png -quality 10% P.Identite.png
ll
convert Piece_Identite2.png -quality 50% P.Identite2.png
ll
mv Piece_Identite2.png ~/External/HD750/Docs/Personal/P.Identite.png
ls
ll
rm P*.*
ll
cd
ls
ll
cd Learn/
ls
cd Rust/
ls
mkdir Alacrity
cd Alacrity
git clone https://github.com/alacritty/alacritty.git
cd alacritty
ls
install cmake freetype-devel fontconfig-devel libxcb-devel libxkbcommon-devel g++
infocmp alacritty
ls
rustup update
cd alacrity
ls
cargo build --release --features=wayland
ll
cd target/release/
ls
ll
./alacritty 
ls
cd ..
ls
cd ..
ls
ls extra/
cd extra/
ls
cd completions/
la
ls
ll
cd ..
ks
ls
ls linux
cd completions/
ls
cp alacritty.bash ~/.bash_completion/alacrity/
lvbash
ls
cd ..
ls
cd ..
ls
cd alacritty
ls
cd ..
cd target/
ls
cd release/
ls
ls examples/
ls
ll
cp alacritty ~/.local/bin/
alacrity
alacritty
rm ~/.local/bin/alacritty 
cd ..
ls
cd ..
ls
cd target/
ls
rm -fr *
;s
ls
cd rs
cd release/
ls
alacritty
.alacritty
ls
ll
ls
cp alacritty ~/.local/bin/
search alacritty
sudo dnf info alacritty
ls
ll
z ala the
z ala
z
z config
z alacritty/
z themes
ls
cd themes/
ls
ll
z
ll
z External/
ll
ls
ll
cd
ll
exit
ll
hyprpicker
ll External/
z ala themes
ls
cd themes/
ls
lv zenburn.toml 
exit
echo "source $(pwd)/extra/completions/alacritty.bash" >> ~/.bashrc
cargo build --release --features=wayland
cargo init
cargo build --release --features=wayland
cargo build --release
ls
ll
rm Cargo.*
ls
rm -fr src
ls target
rm -fr target/
ls bin
sbash
cd .config
ls
ll
ls a*
mkdir alacrity
cd alacrity/
ls
cd
ls
ll
mkdir -p ~/.bash_completion
cp extra/completions/alacritty.bash ~/.bash_completion/alacritty
echo "source ~/.bash_completion/alacritty" >> ~/.bashrc
mkdir -p ~/.bash_completion/alacrity
sbash
ls
cd .bash_completion/alacrity/
ls
mv alacritty.bash ../
cd ..
ls
sbash
alacritty
z 
z Learn/Rust/Alacrity/alacritty/
ls
rust build --release
rustup build --release
cargo build --release
ls
cd target/release/
ls
./alacritty 
ranger
alacritty
ls
cd ..
ls
cd ..
ls
cd extra/
ls
cd linux
ls
cp Alacritty.desktop ~/.local/share/applications/
ls
cd ..
ls
cd logo
ls
cd ..
ls
sudo mkdir -p /usr/local/share/man/man1
sudo mkdir -p /usr/local/share/man/man5
scdoc < extra/man/alacritty.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
scdoc < extra/man/alacritty-msg.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
scdoc < extra/man/alacritty.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty.5.gz > /dev/null
scdoc < extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz > /dev/null
sudo mkdir -p /usr/local/share/man/man1
sudo mkdir -p /usr/local/share/man/man5
scdoc < extra/man/alacritty.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
scdoc < extra/man/alacritty-msg.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
scdoc < extra/man/alacritty.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty.5.gz > /dev/null
scdoc < extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz > /dev/null
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
alacritty --version
cd ..
ls
cd ..
ls
cd Alacrity/
cd alacritty/
ls
cd alacritty
ls
cd src
ls
lv main.rs 
hyprprop
z config/
z
z config
ls
mv alacrity/ alacritty/
ls
ls alacritty/
ll alacritty/
# We use Alacritty's default Linux config directory as our storage location here.
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
cd alacritty/
ls
lv alacritty.toml
exit
ll
cd External/
ll
cd
ll
ls
ll
ls External/
ranger
ll
tldr
tldr rm
tldr rm --help
tldr rm --list
[[hints.enabled]]
command = "xdg-open" # On Linux/BSD
# command = "open" # On macOS
# command = { program = "cmd", args = [ "/c", "start", "" ] } # On Windows
hyperlinks = true
post_processing = true
persist = false
mouse.enabled = true
binding = { key = "U", mods = "Control|Shift" }
regex = "(ipfs:|ipns:|magnet:|mailto:|gemini://|gopher://|https://|http://|news:|file:|git://|ssh:|ftp://)[^\u0000-\u001F\u007F-\u009F<>\"\\s{-}\\^⟨⟩`]+"
ls
ll
ranger
lv
exit
lv
ls
cd openai-env/
ls
ll
ls
cd ..
ls
rm -fr openai-env/
ls Templates/
rm Templates/
rm -fr Templates/
ls
ll
exit
search parec
search sox
search yodotool
ffmpeg -f alsa -list_devices true -i ""
ffmpeg
ffmpeg --help
ffmpeg -f alsa -devices true -i ""
ffmpeg -f v4l2 -devices true -i ""
python -m venv openai-env
source openai-env/bin/activate
pip install --upgrade openai
pip install --upgrade pip
ls
cd openai-env/
ls
ll
lv openai-test.py
ls
python3 openai-test.py 
lv OPENAI_API_KEY.env
ls
python3 openai-test.py 
ls
cat pyvenv.cfg 
cat OPENAI_API_KEY
lv 
python3 openai-test.py 
ls
cd bin
ls
cd ..
ls
ls lib
ls include/
ls include/python3.12/
ls
;s
ls
ll
ls
cp OPENAI_API_KEY key
lv OPENAI_API_KEY.env
lv
python3 openai-test.py 
exit
ls
ll
update
reboot
update
reboot
ping google.com
ping youtube.com
ping youtube.be
ping cloudflare,com
ping cloudflare.com
ping cloud9.com
reboot
LL
ll
lv
flatpak --help
flatpak --list
flatpak list
flatpak repair org.gimp.Gimp
flatpak update
flatpak remove org.gimp.Gimp
flatpak uninstall org.gimp.Gimp
flatpak remove gimp
flatpak install gimp
z .var/app/
ls
z org.squidwol.halloy
z org.squidowl.halloy
ls
z config
ls
z halloy/
ls
cp config.template.yaml config.yaml
lv config.yaml 
lv
z hexc
ls
ll
cat chanopt.conf 
cat hexchat.conf 
cat Fedora.hct 
z hallow
z
openssl req -x509 -new -newkey ed25519 -sha256 -days 1096 -nodes -out libera.pem -keyout libera.pem
ls
z halloy
ls
cd config/
ls
z halloy/
ls
cd config
z config
ls
z he
z ../../hexchat/
ls
cat servlist.conf 
lv servlist.conf 
z dot
git add -A
git commit
git check
git checkout
ls
ls Linux/
ls Linux/Fedora/
syncos
git add -A
git checkout
git commit
git push
z
ls
ll
z .pki
ls
cd nssdb/
ls
cat pkcs11.txt 
z hexch
ls
mkdir certs
cp ~/libera.pem certs/
ls certs/
z hallo
ls
cd config/
ls
cd halloy/
ls
cp ~/libera.pem .
ls
z
flatpak remove halloy
z var
z .var/app/
ls
ll
rm -fr org.squidowl.halloy/
ls
z
ls
rm libera.pem 
install qemu
install virt-manager
search libguests
search libguestsfs
systemctl start qemu
reboot
update
search corsair
htop
hytop
bpytop
search hyperidle
z hyprland
z hypr
ls
lv hypridle.conf
z dow
ls
ex v0.1.1.tar.gz 
ls
cd hypridle/
ls
mv hypridle ~/.config/hypr/
z hypr
ls
./hypridle 
z down
ls
ex hypridle-0.1.1.zip 
ls
cd hypridle
ls
ll
cd ..
ls
cd hypridle-0.1.1/
ls
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build
cmake --build ./build --config Release --target hypridle -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
install cmake
search wayland-protocols
install wayland-protocols
install wayland-protocols-devel
search sdbus
install sdbus-cpp sdbus-cpp-tools sdbus-cpp-devel -y
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build
cmake --build ./build --config Release --target hypridle -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
search hyprlang
install hyperlang hyperlang-devel -y
install hyprlang hyprlang-devel -y
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build
cmake --build ./build --config Release --target hypridle -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install build
z hypr
ls
./hypridle 
lv
bpytop
s-tui
install powerstat
z down
ls
ex powerstat-0.04.02.zip 
ll
cd powerstat-0.04.02/
ls
cd rpm/
ls
cd ../
ls
cmake build
make build
make
ls
./powerstat 
./powerstat -d 1
./powerstat -d 1 -z
powertop
sudo powertop
ls -lat
ls lat
cd
ls -lat
install swayidle
z con
ls
cd sway
ls
lv idle.conf
swayidle -c ~/.config/sway/idle.conf
ls
swayidle -C ~/.config/sway/idle.conf
cat idle.conf 
lv
swayidle -C ~/.config/sway/idle.conf
swayidle -w 	timeout 300 'swaylock -f -c 000000' 	timeout 600 'swaymsg "output * dpms off"' 		resume 'swaymsg "output * dpms on"'
swayidle -w timeout 10 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"'
sudo swayidle -w timeout 10 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"'
reboot
powertop
sudo powertop
liquidctl list
liquidctl status
sudo liquidctl status
z hypr
ll
./hypridle 
sensors
sensors --help
./hypridle 
update
reboot
swayidle -w           timeout 10 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
swayidle -w           timeout 10 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"'
swayidle -w           timeout 600 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
sway --get-socketpath
env | grep -F "SWAYSOCK"
export SWAYSOCK=/run/user/$(id -u)/sway-ipc.$(id -u).$(pgrep -x sway).sock
sway --get-socketpath
swayidle -w           timeout 10 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"'
swaymsg -t test
swaymsg -t [test]
swaymsg -t
swayidle -m *           timeout 10 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"'
z dot
ks
ls
cd ..
ls
cd Obsidian/
ls
cd Cheet-Sheets/
ls
ll
cd ssh
ls
ll
chown -x *
chmod -x *
ll
cat ssh_config.md 
ls
ssh user@192.168.122.221
 user@192.168.122.211
ssh root@192.168.122.221
ssh user@192.168.122.221
ssh root@192.168.122.221
ssh user@192.168.122.221
sudo firewall-cmd --permanent --add-service=ssh
ssh user@192.168.122.221
swaylock
swaylock -f -c 000000
lv
update
z swa
ls
rm idle.conf 
lv idle.sh
chmod +x idle.sh 
reboot
lv
update
reboot
sudo dnf 
lv]
lv
duf
update
cd Downloads
ls
cd Lorien_v0.6.0_Linux/
ls
./Lorien.x86_64 
ls
DD_API_KEY=d711815fd9992b48e12a8e2c48affe12 DD_SITE="datadoghq.eu" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script_agent7.sh)"
update
reboot
search chrome
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install google-chrome-stable
reboot
hyprprop
lv
update
reboot
flatpak update
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf groupupdate multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld
sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld
update
reboot
search gstreamer
dnf info gstreamer1
reboot
hyprprop
flatpak install flathub com.ktechpit.ultimate-media-downloader
remove video-downloader
hyprprop
search youtube
install video-dowloader
install video-downloader
ls
ll
ls
lv
reboot
ls
ls ~/
ll ~/
z Relax/
ls
mv Hibernate-SCd7sHwFmaw.mp3 Hibernate-Kupla.mp3 
zik
fzf
ls
g
z
ls
exit
cd External/
ls
cd HD750
ls
ll
cd Music
ls
ll
mkdir Relax
tmux
exit
z wayb
ls
cat style.css 
lv config.jsonc 
ls
tmux
la
g
tmux --help
tmux sessions
tmux list
tmux list-sessions 
tmux 
tmux list-sessions 
tmux list-windows
tmux 1
tmux s 1
lv
z config
ls
z alacritty/
ls
lv alacritty.toml 
z umd
ls
ll
mv 'Code Music 💻 Coding Lofi 📚 Lofi Playlist To Study ｜ Chill Beats-ibMgVK6Mxuk.mp3' Code_Music_Study_Chill.mp3
ll
mv ~/External/HD750/Music/Relax/
mv Code_Music_Study_Chill.mp3 ~/External/HD750/Music/Relax/
z conf
ls
z hex
ls
g 
ls
ll
zik
reboot
waybar --help
killall waybar
waybar
cd cdcdcdcdcdcdc
cd scripts/
ls
syncos
z dot
ls
git add -a
git add a
git add -A
git commit -m "Another min update"
git pull
git push
z hypr
ls
ll
z hex
ls
g certs
ls
cd ..
rm -fr certs/
ls
z dotfi
ls
git add -A
git commit -m "And another one"
git push
ls
cd Linux/
ls
cd Fedora/
cd .config/
ls
ll
cd hexchat/
ls
rm -fr certs/
z dot
ls
cd Linux/
cd Fedora
ls
ll
cd .scripts
ls
cd .config/hexchat/
ls
z dot
ls
git push
ll
cd .git
ls
ll
cd ..
ls
ll
lv .gitignore
git add .gitignore
git commit -m "Add .gitignore file"
git rm --cached Linux/Fedora/.config/hexchat/certs/libera.pem
git rm --cached libera.pem
lazygit
zik
zik
z Obs
ls
ls no
ls Notes/
cd ..
g C
g
g obs No
g Obssi No
g Obssi Ch
g
g Git/Obsidian/Cheet-Sheets/
ls
ll
xdg github-git-cheat-sheet.pdf 
xdg-open github-git-cheat-sheet.pdf 
ssh-keygen -t ed25519
cd .ssh/
ls
cat Github_id_ed25519.pub 
cat Github_id_ed25519
g git obsi
g chee
ls
ll
xdg-open ssh/ssh_config.md 
git pull
ls
z dot
ls
ll
rm -fr .git
git init
ls
cd ..
ls
mv dotfiles/ dots
ls
git clone git@github.com:DACDParis/dotfiles.git
ls
gh auth
gh auth login
git clone git@github.com:DACDParis/dotfiles.git
ls
ls dotfiles/
ll dotfiles/
ls
cd dots
ls
ll
rm -fr .git
rm README.md 
rm LICENSE 
l
ll
mv . ../dotfiles/
cd ..
ls
cd dots
cp . ../dotfiles/
cp -r . ../dotfiles/
cd ../dotfiles/
ls
ls Linux/
ls Linux/Fedora/
ll
cd ..
cd dotfiles/
ls
git add -A
git rm --cached Linux/Fedora/.config/emacs
git rm --cached Linux/Fedora/.config/emacs -f
cd Linux/Fedora/.config/emacs/
ll
cd ..
ls
rm -fr emacs
cd ../../..
s
ls
git commit -m "First one"
ls
cd Linux
ls
cd Fedora
ls
cd .config
ls
cd hexchat/
ls
cd ..
cd .
cd ..
ls
cd ..
ls
cd dots
ls
lv
cd ..
ls
rm -fr dot*
ls
rm -fr dotfiles/
ls
g scrip
ls
lv syncos 
g git
ls
lv .gitignore
syncos
mv .gitignore dotfiles/
ls
ll dotfiles/
mv .gitignore 
mv .gitignore dotfiles/
syncos
ls
cd dotfiles/
ls
git add -A
git help submodule
git add -A
git commit -m "2"
git push
gh auth login
git push
systemctl restart sshd
git push
gh auth login
git push
ls
syncos
ls
ll
git checkout
cd .config
g
cd .config
cd qBittorrent/
ls
cat qBittorrent.conf 
g git
ld
ls
rm -fr dotfiles/
ls
syncos
ls
cd dotfiles
ls
gh auth login
git merge --help
git pull
git pull origin main
git pull main origin
git remote --help
git remote add -t main
git remote add -f main
ls
ll
git init
ll
git add .
git rm --cached Linux/Fedora/.config/nvim/pack/plugins/start/nvim-dap
git rm --cached Linux/Fedora/.config/nvim/pack/plugins/start/nvim-dap -f
git commit -m "Initial commit v2"
git remote add origin https://github.com/DACDParis/dotfiles.git
git push -u origin main
git push -u origin master
git config --global init.defaultBranch main
git push -u origin main
cd ..
ls
rm -fr dotfiles/
ls
git clone https://github.com/DACDParis/dotfiles.git
cd dotfiles/
ls
syncos
ls
lv .gitignore
git add -A
lv
ls
ll
git rm --cached Linux/Fedora/.config/nvim/pack/plugins/start/nvim-dap
git rm --cached Linux/Fedora/.config/nvim/pack/plugins/start/nvim-dap -f
git commit -m "2"
git push
lv
git add -A
git commit -m "3"
git push
ls
mkdir NixOS
lv
install fzf
search junegunn/fzf.vim
search the_silver_searcher
install the_silver_searcher
lv
touch .fzf_history
sbash
fd
ls
ll
z che
ls
lv .ignore
lv my_vim_cheets.md 
ls
ll
exit
sbash
lv
tmux
lv
tmux
exit
t
exit
lv
lv
vl
lv
syncos
