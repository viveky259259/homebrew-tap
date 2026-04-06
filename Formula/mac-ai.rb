class MacAi < Formula
  desc "MCP orchestrator powered by Apple Foundation Models"
  homepage "https://github.com/viveky259259/mac-ai"
  url "https://github.com/viveky259259/mac-ai/releases/download/v0.1.0/mac-ai-v0.1.0-aarch64-apple-darwin.tar.gz"
  sha256 "PLACEHOLDER"
  license "MIT"
  version "0.1.0"

  depends_on :macos

  def install
    bin.install "mac-ai"
    bin.install "foundation-bridge"
  end

  def caveats
    <<~EOS
      mac-ai requires macOS 26+ with Apple Intelligence enabled.

      Create a config file at ~/.config/mac-ai/config.json:
        mkdir -p ~/.config/mac-ai
        cp #{etc}/mac-ai/config.example.json ~/.config/mac-ai/config.json

      Then run:
        mac-ai --query "Hello"
    EOS
  end

  test do
    assert_match "mac-ai", shell_output("#{bin}/mac-ai --help")
  end
end
