cask "pr-helper" do
  version "0.3.0"
  sha256 "13e402dcc6fc7d533a9c876f147719af3834a66b695297ef8f3bb0def2c9bf96"

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
