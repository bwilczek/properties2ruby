module Helpers
  SAMPLES = [
    {
      name: 'Integer',
      text: 'key=123',
      ruby: { key: 123 }
    },
    {
      name: 'String',
      text: 'key=value',
      ruby: { key: 'value' }
    },
    {
      name: 'Basic hash',
      text: 'h.a=v',
      ruby: { h: { a: 'v' } }
    },
    {
      name: 'Nested hash',
      text: 'h.a.b=v',
      ruby: { h: { a: { b: 'v' } } },
      # tags: { focus: true }
    },
    {
      name: 'Nested hash, 2 entries',
      text: "h.a.x=v1\nh.a.y=v2",
      ruby: { h: { a: { x: 'v1', y: 'v2' } } },
      # tags: { focus: true }
    },
  ].freeze
end
