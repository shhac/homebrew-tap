class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.7.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.1/agent-notion-darwin-arm64.tar.gz"
      sha256 "5a3d6b7383d125d34ad1b430f485f2dc547b040b6deabab6af19c20401e18ab2"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.1/agent-notion-darwin-amd64.tar.gz"
      sha256 "b2254890f4377129156aff2499f1a360f69f9fb98b446599526025761f9c454e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.1/agent-notion-linux-arm64.tar.gz"
      sha256 "3116ab96c4e58bcdf7498d5bff261f51f379eeef6ef0a0e3010da2f183e58854"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.1/agent-notion-linux-amd64.tar.gz"
      sha256 "550309e14a24cc4226af38fba0f2eee321d88d9d50c26dcf0834cf19671a3557"
    end
  end

  def install
    bin.install "agent-notion"
    # Installs shell completions via `agent-notion completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-notion", "completion")
  end

  test do
    assert_match "0.7.1", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI for humans and LLMs", shell_output("#{bin}/agent-notion --help")
    assert_match "#compdef agent-notion", shell_output("#{bin}/agent-notion completion zsh")
  end
end
