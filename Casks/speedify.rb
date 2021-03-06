cask "speedify" do
  version "11.4.0,8692"
  sha256 :no_check

  url "https://downloads.speedify.com/speedify.php?platform=osx"
  name "Speedify"
  desc "VPN client"
  homepage "https://speedify.com/"

  livecheck do
    url :url
    strategy :extract_plist
  end

  app "Speedify.app"

  uninstall launchctl: [
    "me.connectify.SMJobBlessHelper",
    "SwitchboardService",
    "SpeedifyService",
  ],
            script:    "#{appdir}/Speedify.app/Contents/Resources/uninstall-speedify-service.sh"

  zap trash: "~/Library/Speedify"
end
