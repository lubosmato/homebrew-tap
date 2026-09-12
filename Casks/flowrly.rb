cask "flowrly" do
  version "0.1.0"
  sha256 "58a6ec0ad738b585c990c332c685013a4291fcfbf63db1eceea00cb7008230e6"

  url "https://github.com/lubosmato/flowrly/releases/download/v#{version}/Flowrly_#{version}_aarch64.dmg"
  name "Flowrly"
  desc "Time tracking and Fakturoid invoicing for freelancers"
  homepage "https://github.com/lubosmato/flowrly"

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "Flowrly.app"

  # The app is not notarized; drop the quarantine flag so Gatekeeper lets it launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Flowrly.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/cz.lubosmatejcik.flowrly",
    "~/Library/Logs/cz.lubosmatejcik.flowrly",
  ]
end
