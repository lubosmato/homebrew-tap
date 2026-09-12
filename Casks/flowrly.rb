cask "flowrly" do
  version "0.1.2"
  sha256 "5e72e0823ff8b2f58c30c3a9a553dad4ea245629c2553cad6ff37634f30d8fb2"

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
