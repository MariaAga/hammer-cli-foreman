module HammerCLIForeman::Output
  module Formatters

    class OSNameFormatter < HammerCLI::Output::Formatters::FieldFormatter

      def tags
        [:flat]
      end

      def format(os)
        return nil if os.nil?

        name = os['name'] || os[:name]
        major = os['major'] || os[:major]
        minor = os['minor'] || os[:minor]

        formatted_name = "%s %s" % [name, major]
        formatted_name += ".%s" % minor if (!minor.nil? && !minor.empty?)
        formatted_name
      end
    end

    class ServerFormatter < HammerCLI::Output::Formatters::FieldFormatter

      def tags
        [:flat]
      end

      def format(server)
        "%s (%s)" % [server[:name], server[:url]] unless server.nil?
      end
    end

    HammerCLI::Output::Output.register_formatter(OSNameFormatter.new, :OSName)
    HammerCLI::Output::Output.register_formatter(ServerFormatter.new, :Server)

  end
end
