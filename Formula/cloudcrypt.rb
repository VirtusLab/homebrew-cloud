class Cloudcrypt < Formula
  desc "Universal cryptographic tool with AWS KMS, GCP KMS and Azure Key Vault support"
  homepage "https://github.com/VirtusLab/crypt"
  url "https://github.com/VirtusLab/crypt/archive/v0.1.1.tar.gz"
  sha256 "6e70113bc3b041f01cd667f09eea07c3f85e68077ec0ccf9510de35de3bfb1dd"

  depends_on "go" => :build
  depends_on "dep" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["BUILDING_FROM_TGZ"] = "yes"

    bin_path = buildpath/"src/github.com/VirtusLab/crypt"

    bin_path.install Dir["*"]
    cd bin_path do

      system "make", "dep"
      system "make", "status"
      system "make", "static", "NAME=cloudcrypt"
      bin.install "cloudcrypt"
    end
  end

  test do
    system "env"
    system "pwd"
    system bin/"cloudcrypt", "-v"
  end
end
