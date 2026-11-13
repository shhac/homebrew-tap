class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.56.0/g2g-darwin-arm64.tar.gz"
      sha256 "60c407a85b918ed10694e31326ec2b2b6aff8ab30bc037fcab8bbdfab25fbd43"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.56.0/g2g-darwin-amd64.tar.gz"
      sha256 "58653edcb9ff977b7c9ac69931467f997b38d7958682ea4f05f191f768f4184e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.56.0/g2g-linux-arm64.tar.gz"
      sha256 "afc524099beaf141f714e036d8c7399c46c0e9946a94ffc1b734439508d66982"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.56.0/g2g-linux-amd64.tar.gz"
      sha256 "a9286c0d4479bafa75b9b8259371898eab66294b63e7e3957e2c35c7df66c7ce"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.56.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
