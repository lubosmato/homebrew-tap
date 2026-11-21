cask "flowrly" do
  version "0.1.9"
  sha256 "47d5366e7b46b562b792b4b053f34c1c09fe434d01ca9bcf8e24e58137a11f66"

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
