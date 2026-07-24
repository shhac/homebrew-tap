class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.10.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.10.1/agent-notion-darwin-arm64.tar.gz"
      sha256 "eec4d0049cc090d83249bbfb371dfe303fc68577282c2a05c705f94761a419ee"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.10.1/agent-notion-darwin-amd64.tar.gz"
      sha256 "36d808ad09ba8c92f9fec070aed2ed5fe8f5a45c0e452d6f3699a3ad9d87b126"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.10.1/agent-notion-linux-arm64.tar.gz"
      sha256 "2de009b6f41c1adcf4aa041766bdd9c71b4928fb682438c0ce3f2d95fb5d0199"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.10.1/agent-notion-linux-amd64.tar.gz"
      sha256 "970a5924d0d9031e2774538f2b5be7833e7231f5fdb933aaab9eaa358ca734b7"
    end
  end

  def install
    bin.install "agent-notion"
    # Installs shell completions via `agent-notion completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-notion", "completion")
  end

  test do
    assert_match "0.10.1", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI for humans and LLMs", shell_output("#{bin}/agent-notion --help")
    assert_match "#compdef agent-notion", shell_output("#{bin}/agent-notion completion zsh")
  end
end
