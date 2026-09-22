class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.32.0/g2g-darwin-arm64.tar.gz"
      sha256 "69aee3a364384f43b04b6eff250f1461a8d730444eadb488f0b63dd9f7b290ca"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.32.0/g2g-darwin-amd64.tar.gz"
      sha256 "b7b9334aa479f55ae69713042a3ad9d2295c6960b2cf30a5ef39339e9a72053c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.32.0/g2g-linux-arm64.tar.gz"
      sha256 "bee7b5b354f5d11a7eb856ad29f938a4dd8309698dad4ea9874d5d4c2d4f8e4c"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.32.0/g2g-linux-amd64.tar.gz"
      sha256 "42452fb98de4b4fae0f0508bb3454ea5b72832f4819fa980a2f9aeb1f38856d6"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.32.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
