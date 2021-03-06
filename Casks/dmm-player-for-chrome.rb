cask "dmm-player-for-chrome" do
  version "1.5.0.10"
  sha256 "c9a564a31b8d29f72085c9b4eada52a03ca3fa0fd3cd50fed3a071c614ddef39"

  url "https://portalapp.dmm.com/silverlightplayer/dmm/m/#{version.dots_to_underscores}/DMMPlayerForChromeInstaller_#{version.dots_to_underscores}.pkg"
  name "DMM Player for Chrome"
  desc "Play videos from DMM in Chrome"
  homepage "https://www.dmm.com/digital/info_for_chrome_user_html/"

  livecheck do
    url :homepage
    regex(/href=.*?DMMPlayerForChromeInstaller[._-]?v?(\d+(?:[._]\d+)*)\.pkg/i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| match[0].tr("_", ".") }
    end
  end

  pkg "DMMPlayerForChromeInstaller_#{version.dots_to_underscores}.pkg"

  uninstall pkgutil: [
    "com.apple.ScriptEditor.id.DMMPlayerForChrome*",
    "1022638813.chrome.player.dmm.com",
  ]
end
