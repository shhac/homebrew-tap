class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.30.0/g2g-darwin-arm64.tar.gz"
      sha256 "123cdffde2dd75f3923cde2b539486167ecb3a63088ac631ac8806d133adfc08"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.30.0/g2g-darwin-amd64.tar.gz"
      sha256 "3f14afbdf9c7fc16269e4e51346e97a845e80545f162d49dbddaf083db80cc24"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.30.0/g2g-linux-arm64.tar.gz"
      sha256 "8bf2953c6597970b0bff545e9de9f7aa17ae32eb7c371f6fe8ef986944f23b96"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.30.0/g2g-linux-amd64.tar.gz"
      sha256 "8d89cd441578ff54582f42ad8ab0f8cb797178ff0bea3e5cb557444baeb1f300"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.30.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
