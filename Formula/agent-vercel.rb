class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.6.1/agent-vercel-darwin-arm64.tar.gz"
      sha256 "970b0edaf63a6902afab2a27c4a3132988afd619cd2a4e5e46ad2243c3228bd2"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.6.1/agent-vercel-darwin-amd64.tar.gz"
      sha256 "2b48dbc6ad060bfded48bb94df6e421f80eed0e4c9648a2484b7276a9a9bb36e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.6.1/agent-vercel-linux-arm64.tar.gz"
      sha256 "c92f4976437075a30bd45e85eccd9931773b0f080e57fe58370f61f56763f1b7"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.6.1/agent-vercel-linux-amd64.tar.gz"
      sha256 "17f983f3847b77d2875a48e3c69cf25c3e80b8dbe4ee07ab1f6d2d517f54f1bc"
    end
  end

  def install
    bin.install "agent-vercel"
    # Installs shell completions via `agent-vercel completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-vercel", "completion")
  end

  test do
    assert_match "0.6.1", shell_output("#{bin}/agent-vercel --version")
    assert_match "Vercel CLI for AI agents", shell_output("#{bin}/agent-vercel --help")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
  end
end
