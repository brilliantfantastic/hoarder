require 'openssl'

module Hoarder
  module Passbook
    # This does not appear in the manifest but it is part of the zip file
    class Signature
      def initialize(manifest)
        @manifest = manifest
      end

      def data
        signed = signed_certificate
        head = "filename=\"smime.p7s\"\n\n"
        data = signed[signed.index(head) + head.length..signed.length-1]
        tail = "\n\n------"
        data = data[0..data.index(tail) - 1]

        Base64.decode64(data)
      end

      private

      def certificate
        OpenSSL::PKCS12.new File.read(config.certificate_path),
                            config.certificate_password
      end

      def wwdc_certificate
        OpenSSL::X509::Certificate.new File.read(config.wwdc_certificate_path)
      end

      def signed_certificate
        cert = certificate
        pk7 = OpenSSL::PKCS7.sign cert.certificate,
                                  cert.key,
                                  @manifest.to_s,
                                  [wwdc_certificate],
                                  OpenSSL::PKCS7::BINARY | OpenSSL::PKCS7::DETACHED
        OpenSSL::PKCS7.write_smime pk7
      end

      def config
        Hoarder::Passbook.configuration
      end
    end
  end
end
