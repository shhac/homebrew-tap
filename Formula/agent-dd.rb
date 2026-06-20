class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.8.0/agent-dd-darwin-arm64.tar.gz"
      sha256 "d245838d70ec688d48e627f59db6fdc5536b547c9555365c29dc23f901fac60b"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.8.0/agent-dd-darwin-amd64.tar.gz"
      sha256 "1874309dccb1ed42fd1d15c6eb4b8858dec80310b42033323cc3d4858e368a18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.8.0/agent-dd-linux-arm64.tar.gz"
      sha256 "10d11b281c2857441f9691e57caef0112be3cd6366a8093f7f6f079b06a8ed9c"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.8.0/agent-dd-linux-amd64.tar.gz"
      sha256 "aa0cdbb34fad98dff5ca9de41913561fab7ff0861b0fd3041c0daf20bd166362"
    end
  end

  def install
    bin.install Dir["agent-dd-*"].first => "agent-dd"
  end

  test do
    assert_match "0.8.0", shell_output("#{bin}/agent-dd --version")
    assert_match "Datadog", shell_output("#{bin}/agent-dd --help")
  end
end
