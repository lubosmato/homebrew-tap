cask "flowrly" do
  version "0.1.8"
  sha256 "a5a3ed7f676af406ffaf0d9276d2fd7c9a802d01dfec5c56138fac48a82823b7"

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
