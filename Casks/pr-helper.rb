cask "pr-helper" do
  version "0.2.0"
  sha256 "5987246b02df70b8e5fe4a766a638ea53a80972e58353388c664e1500f4ce557"

  url "https://github.com/Joessst-Dev/pr-helper/releases/download/v#{version}/PR-Helper_#{version}_universal.dmg"
  name "PR Helper"
  desc "Claude-powered PR reviews for GitHub and GitLab"
  homepage "https://github.com/Joessst-Dev/pr-helper"

  livecheck do
    skip "Auto-generated on release."
  end

  depends_on :macos

  app "PR Helper.app"

  # Ad-hoc signed, not notarized: strip quarantine so Gatekeeper allows the first launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/PR Helper.app"],
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/dev.jostweyers.prhelper",
    "~/Library/Caches/dev.jostweyers.prhelper",
    "~/Library/Preferences/dev.jostweyers.prhelper.plist",
    "~/Library/WebKit/dev.jostweyers.prhelper",
  ]

  caveats <<~EOS
    PR Helper needs the Claude Code CLI (`claude`) on your PATH, for example:
      brew install --cask claude-code

    API tokens live in the macOS Keychain and are not removed by `brew uninstall --zap`.
  EOS
end
