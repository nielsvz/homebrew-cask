cask "feishu" do
  if Hardware::CPU.intel?
    version "4.8.3,19e5df"
    sha256 "11b5e7a84fe81bcddc9a24d62cfe4edb616291725c98dc6593c5272c75e8d55c"

    url "https://sf3-cn.feishucdn.com/obj/ee-appcenter/#{version.after_comma}/Feishu-darwin_x64-#{version.before_comma}-signed.dmg",
        verified: "sf3-cn.feishucdn.com/"

    livecheck do
      url "https://www.feishu.cn/api/downloads"
      strategy :page_match do |page|
        match = page.match(%r{/(\h+)/Feishu-darwin_x64-(\d+(?:\.\d+)*)-signed\.dmg}i)
        "#{match[2]},#{match[1]}"
      end
    end
  else
    version "4.8.3,48ad12"
    sha256 "a0823ff89485c70d485f4c42802af471c28aaf5e1e409a20cd9a1cc5fb4eb2d5"

    url "https://sf3-cn.feishucdn.com/obj/ee-appcenter/#{version.after_comma}/Feishu-darwin_arm64-#{version.before_comma}-signed.dmg",
        verified: "sf3-cn.feishucdn.com/"

    livecheck do
      url "https://www.feishu.cn/api/downloads"
      strategy :page_match do |page|
        match = page.match(%r{/(\h+)/Feishu-darwin_arm64-(\d+(?:\.\d+)*)-signed\.dmg}i)
        "#{match[2]},#{match[1]}"
      end
    end
  end

  name "feishu"
  desc "Project management software"
  homepage "https://www.feishu.cn/"

  auto_updates true

  # Renamed for consistency: app name is different in the Finder and in a shell.
  app "Lark.app", target: "Feishu.app"

  zap trash: [
    # feishu
    "~/Library/Caches/com.bytedance.lark.helper",
    "~/Library/Preferences/com.bytedance.lark.helper.plist",
    # lark
    "~/Library/Caches/com.electron.lark.helper",
    "~/Library/Preferences/com.electron.lark.helper.plist",
    # both
    "~/Library/Caches/com.electron.lark",
    "~/Library/Saved Application State/com.electron.lark.savedState",
  ]
end
