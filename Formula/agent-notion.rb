class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.7.4"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.4/agent-notion-darwin-arm64.tar.gz"
      sha256 "2c218133d4f18ac021f92737c3dd2856fe3d6896d67179f7b3d0dbfc8d3363da"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.4/agent-notion-darwin-amd64.tar.gz"
      sha256 "26dbe665d6697bc028a5483e1bd913b5256af386a5bc1b7f036cd83c29aa2e5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.4/agent-notion-linux-arm64.tar.gz"
      sha256 "036c3e18d5002af49ca694faa260a8163c2817f72fd3cc0860e9bc11902d1199"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.4/agent-notion-linux-amd64.tar.gz"
      sha256 "19abf25ba2a9121db88dcdee53b55b663353b3ad04ac7e997a4ae719c79e5ce7"
    end
  end

  def install
    bin.install "agent-notion"
    # Installs shell completions via `agent-notion completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-notion", "completion")
  end

  test do
    assert_match "0.7.4", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI for humans and LLMs", shell_output("#{bin}/agent-notion --help")
    assert_match "#compdef agent-notion", shell_output("#{bin}/agent-notion completion zsh")
  end
end
