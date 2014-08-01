module Puppet::Parser::Functions
  newfunction(:file_join, :type => :rvalue, :doc => <<-EOS
This function emulates File.join and returns a valid when
given an Array argument.

*Examples:*

    file_join(["/foo","bar"])

Would return: "/foo/bar"

    EOS
  ) do |args|

    # Validate the number of args
    if args.size != 1
      raise(Puppet::ParseError, "file_join(): Takes exactly one " +
            "args, but #{args.size} given.")
    end

    parts = args[0]

    # Validate the argument.
    if not parts.is_a?(Array)
      raise(TypeError, "file_join(): The argument must be an " +
            "Array, but a #{parts.class} was given.")
    end

    result = File.join(parts)
    result
  end
end
