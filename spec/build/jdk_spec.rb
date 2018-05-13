
describe command("jrunscript -e 'print (javax.crypto.Cipher.getMaxAllowedKeyLength(\"RC5\") >= 256);'") do
  its(:stdout) {should contain 'true'}
end

