cask "ambient" do
  version "0.10.0"
  sha256 "cecde665adc44434c7887924a597259716e3f1a189a1da1ed0ca6717649deb68"

  # ?ref=brew labels these downloads in yaml.cafe's counts, which store no IP address or cookie.
  url "https://yaml.cafe/downloads/Ambient-#{version}.dmg?ref=brew"
  name "Ambient"
  desc "Notch island, notifications and Dock glow for coding agents"
  homepage "https://yaml.cafe/"

  livecheck do
    url "https://github.com/viveky259259/ambient"
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Ambient.app"
  binary "#{appdir}/Ambient.app/Contents/Helpers/ambient"

  uninstall quit: "com.viveky259259.Ambient"

  zap trash: [
    "~/.ambient",
    "~/Library/Caches/com.viveky259259.Ambient",
    "~/Library/HTTPStorages/com.viveky259259.Ambient",
    "~/Library/Preferences/com.viveky259259.Ambient.plist",
  ]

  caveats <<~EOS
    Open Ambient and click Connect All, or run `ambient install`, to connect your agents.
    Before `brew uninstall --zap ambient`, run `ambient uninstall` to take Ambient's hooks
    out of your agents' settings.
  EOS
end
