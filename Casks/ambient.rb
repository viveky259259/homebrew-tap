cask "ambient" do
  version "0.8.0"
  sha256 "b36bc31d603ff59aa021143170bc7ae50a13cd127a6e0a8b23780e3af09b66a5"

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
