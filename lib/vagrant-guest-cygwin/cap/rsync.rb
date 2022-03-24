module VagrantPlugins
  module GuestCygwin
    module Cap
      class RSync
        def self.rsync_installed(machine)
          machine.communicate.test("which rsync")
        end

        def self.rsync_command(machine)
          "sudo rsync"
        end

        def self.rsync_pre(machine, opts)
          guest_path = Shellwords.escape(opts[:guestpath])
          machine.communicate.sudo("mkdir -p #{guest_path}")
        end

        def self.rsync_post(machine, opts)
          if opts.key?(:chown) && !opts[:chown]
            return
          end

          machine.communicate.sudo(build_rsync_chown(opts))
        end

        def self.build_rsync_chown(opts)
          guest_path = Shellwords.escape(opts[:guestpath])
          if(opts[:exclude] && !Array(opts[:exclude]).empty?)
            exclude_base = Pathname.new(opts[:guestpath])
            exclusions = Array(opts[:exclude]).map do |ex_path|
              ex_path = ex_path.slice(1, ex_path.size) if ex_path.start_with?(File::SEPARATOR)
              "-path #{Shellwords.escape(exclude_base.join(ex_path))} -prune"
            end.join(" -o ") + " -o "
          end
          # in cygwin group does not automatically exists for user (so ignore group)
          "find #{guest_path} #{exclusions}" \
            "'!' -type l -a " \
            "'(' ! -user #{opts[:owner]} ')' -exec " \
            "chown #{opts[:owner]} '{}' +"
        end
      end
    end
  end
end
