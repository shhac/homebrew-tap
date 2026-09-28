class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.37.0/g2g-darwin-arm64.tar.gz"
      sha256 "4cb85d5b5fa5a5afc836d843b83f146a2603e2100828f3606ebb3b3f1e10ff50"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.37.0/g2g-darwin-amd64.tar.gz"
      sha256 "c63a0c5a4450abb49a41a937c05b82897e9246e1fce2354041355a1118daad5d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.37.0/g2g-linux-arm64.tar.gz"
      sha256 "3f571f45ad17d0927464a7c9821c02d154a09713681ca329600da6adc931c555"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.37.0/g2g-linux-amd64.tar.gz"
      sha256 "fc363ea17a6b9c7b0c2c6589da624e5511ee06b7434b7bea5cba3641c931416a"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.37.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
