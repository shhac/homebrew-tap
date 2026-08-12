class Gt2gh < Formula
  desc "Bridge Graphite-managed linear stacks to GitHub native stacks"
  homepage "https://github.com/shhac/gt2gh"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.1.0/gt2gh-darwin-arm64.tar.gz"
      sha256 "7cf90e044b405b585f076f312151d7651c4f42f6dbd418714015fafae0c92ab4"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.1.0/gt2gh-darwin-amd64.tar.gz"
      sha256 "0d51d7088dd2e69053b1daf066a883d9253ee08c05b204ee87507d898752107b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.1.0/gt2gh-linux-arm64.tar.gz"
      sha256 "5bfcb4ef44e84416ac925a11ff25d379ffa1e4d4a7ac0c7a7e7add339733fd0c"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.1.0/gt2gh-linux-amd64.tar.gz"
      sha256 "9546e1c2d1aed87e27834716db319a6928cd61ba7dbcbd8594dffc994fce030c"
    end
  end

  def install
    bin.install "gt2gh"
    # Installs shell completions via `gt2gh completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"gt2gh", "completion")
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/gt2gh --version")
    assert_match "Link a linear Graphite stack to GitHub", shell_output("#{bin}/gt2gh --help")
    assert_match "#compdef gt2gh", shell_output("#{bin}/gt2gh completion zsh")
  end
end
