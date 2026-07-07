class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.7.2"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.2/agent-notion-darwin-arm64.tar.gz"
      sha256 "7e9f4e1c0590613dd168b5bfc9c56c37ed882498e7ddb6bffda6b8a5a8cfb8a7"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.2/agent-notion-darwin-amd64.tar.gz"
      sha256 "6d8c4d52b9b69f1ffce3a66e9050d82f65db92ce7ffcd6a5574ed3ba9a19a1b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.2/agent-notion-linux-arm64.tar.gz"
      sha256 "a1d2431b62d8d834df163f1cda7dd7e6079ebc7b8418483225e487f0b8200be6"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.2/agent-notion-linux-amd64.tar.gz"
      sha256 "e60ffd7d7fd2146bdfe5142f37fe9aa1a38681378e98ec0d06c06b2aa0696547"
    end
  end

  def install
    bin.install "agent-notion"
    # Installs shell completions via `agent-notion completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-notion", "completion")
  end

  test do
    assert_match "0.7.2", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI for humans and LLMs", shell_output("#{bin}/agent-notion --help")
    assert_match "#compdef agent-notion", shell_output("#{bin}/agent-notion completion zsh")
  end
end
