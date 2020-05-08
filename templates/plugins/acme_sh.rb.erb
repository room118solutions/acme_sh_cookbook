Ohai.plugin(:Acmesh) do
  provides 'acme_sh'

  collect_data(:default) do
    acme_sh Mash.new

    so = shell_out('/root/.acme.sh/acme.sh --version')

    so.stdout.split("\n").each do |line|
      case line
      when /v(\d+\.\d+\.\d+)/
        acme_sh['installed_version'] = $1
      end
    end
  end
end
