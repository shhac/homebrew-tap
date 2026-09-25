class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.19.1/crew-assistant-darwin-arm64.tar.gz"
      sha256 "68c1f329bffd235708cfb04fdf428459e60023d26c5c9cbf430df2b8180bd48a"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.19.1/crew-assistant-darwin-amd64.tar.gz"
      sha256 "3f89106645d4499a13de73cf1fea018ce8fe2b2f60449b60d08f8c92fdc971a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.19.1/crew-assistant-linux-arm64.tar.gz"
      sha256 "955014a4a35827b925bf4414e150b8b9297254e7dba09ef7987881e5ba5688aa"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.19.1/crew-assistant-linux-amd64.tar.gz"
      sha256 "67f569f0c61818d0488aea4d8702608e717984ff005b9e02e347fe7e1fecae12"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.19.1", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
