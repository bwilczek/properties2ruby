module Helpers
  SAMPLES = [
    {
      name: 'Integer',
      text: 'key=123',
      ruby: { key: 123 }
    },
    {
      name: 'Float',
      text: 'key=123.12',
      ruby: { key: 123.12 }
    },
    {
      name: 'Boolean',
      text: 'key=true',
      ruby: { key: true }
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
      ruby: { h: { a: { b: 'v' } } }
    },
    {
      name: 'Nested hash, 2 entries',
      text: "h.a.x=v1\nh.a.y=v2",
      ruby: { h: { a: { x: 'v1', y: 'v2' } } }
    },
    {
      # tags: { focus: true },
      name: 'Basic array',
      text: "a.0=12\na.1=34",
      ruby: { a: [12, 34] }
    },
    {
      name: 'Nested array, single line',
      text: 'key.0.0=123',
      ruby: { key: [[123]] }
    },
    {
      name: 'Flat array, multi line',
      text: "a.0=123\na.1=456",
      ruby: { a: [123, 456] }
    },
    {
      name: 'Nested array, multi line',
      text: "a.0.0=123\na.0.1=456",
      ruby: { a: [[123, 456]] }
    },
    {
      name: 'Mixed arrays and hashes',
      text: "a.0.x=1\na.0.y=2",
      ruby: { a: [{ x: 1, y: 2 }] }
    }
  ].freeze
end
