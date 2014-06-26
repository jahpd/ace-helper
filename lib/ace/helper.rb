require "ace/helper/version"
require "ace/base"

module Ace
  module Helper
    include Ace::Helper::Base
    include ActionView::Helpers::JavaScriptHelper

    # The javascript that runs:
    # - Audio client based on gibberish.js
    # - Ace editor with post code
    def build(code_string)
      #string = hook_gac()
      string = hook_editor(MODE, THEME)
      string << hook_code(code_string)
      
      # FIX
      # When hook commands, the code do not appears on editor
      # string << hook_ace_commands(RENDER_OPTIONS[:commands], "\n  ")
      javascript_tag(CoffeeScript.compile(string, {:bare => true}, :id => "ace-#{Time.now}")
    end

    protected

    def hook_editor(mode, theme)
      string  = "window.editor = editor = ace.edit('#{mode}_editor')\n"
      string << "editor.setTheme 'ace/theme/#{theme}'\n" 
      string << "editor.getSession().setMode 'ace/mode/#{mode}'\n"
      string << "console.log 'Ace editor loaded!: {mode: #{mode}, theme: #{theme} }'\n"
    end

    def hook_code(code_string)
      s = "#{COMMENT_MESSAGE}#{code_string}"
      string = "editor.setValue '#{escape_javascript(s)}'\n"
      string << "console.log 'code script embeeded to editor!'\n"
    end

    def hook_ace_commands(commands, offset)
      src = ""
      commands.each{|k, v|
        src << "editor.commands.addCommand#{offset}"
        src << "name: '#{k}'#{offset}"
        v.each_pair{|kk, vv| 
          src << "#{kk}: #{vv}#{offset}" 
        }
        src << "readOnly: true\n"
      }
      src << "console.log 'commands added to editor!'\n"
    end
  end
end
