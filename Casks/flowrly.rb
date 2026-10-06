cask "flowrly" do
  version "0.1.4"
  sha256 "3abaec38ff373e460d9e487fe1b11f6bcfd11af3d33265aff7f78d4867080d8d"

  url "https://github.com/lubosmato/flowrly/releases/download/v#{version}/Flowrly_#{version}_aarch64.dmg"
  name "Flowrly"
  desc "Time tracking and Fakturoid invoicing for freelancers"
  homepage "https://github.com/lubosmato/flowrly"

  depends_on arch: :arm64

  app "Flowrly.app"

  # The app is not notarized; drop the quarantine flag so Gatekeeper lets it launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Flowrly.app"]
  end

  zap trash: [
    "~/Library/Application Support/cz.lubosmatejcik.flowrly",
    "~/Library/Logs/cz.lubosmatejcik.flowrly",
  ]
end
