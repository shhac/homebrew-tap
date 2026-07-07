class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.17.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.17.1/agent-postmark-darwin-arm64.tar.gz"
      sha256 "bdca68b71c2800bebeb8585ef9864aa04807ef9d144d2080d4e3f9f8f11ade90"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.17.1/agent-postmark-darwin-amd64.tar.gz"
      sha256 "f9ac42d91fd647caea96d39e5fadd153b9236687b75ea0d582e6a0b5f9a6bcaf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.17.1/agent-postmark-linux-arm64.tar.gz"
      sha256 "3a37cd3154893ef4b7341744478ba4cd86cb56ee9c1c6131b10a1bb7e6b2a250"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.17.1/agent-postmark-linux-amd64.tar.gz"
      sha256 "94f20e4d679ddc45ca1b06e0c935514bc577757de5045f7c7c409ccd1fe49cec"
    end
  end

  def install
    bin.install "agent-postmark"
    # Installs shell completions via `agent-postmark completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-postmark", "completion")
  end

  test do
    assert_match "0.17.1", shell_output("#{bin}/agent-postmark --version")
    assert_match "Postmark delivery triage CLI", shell_output("#{bin}/agent-postmark --help")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
  end
end
