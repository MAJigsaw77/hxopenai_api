# hxopenai_api

![](https://img.shields.io/github/repo-size/MAJigsaw77/hxopenai_api) ![](https://badgen.net/github/open-issues/MAJigsaw77/hxopenai_api) ![](https://badgen.net/badge/license/MIT/green)

Haxe bindings for [OpenAI API](https://www.openai.com/api).

### Installation

You can install it through `Haxelib`
```bash
haxelib install hxopenai_api
```
Or through `Git`, if you want the latest updates
```bash
haxelib git hxopenai_api https://github.com/MAJigsaw77/hxopenai_api.git
```

### Basic Usage Example

```haxe
package;

import hxopenai_api.OpenAI;

class Main
{
	public static function main():Void
	{
		var client:OpenAI = new OpenAI('your key');

		final request:ChatCompletionRequest = {
			model: 'gpt-3.5-turbo',
			messages: [
				{
					role: 'system',
					content: 'You are a helpful assistant.'
				},
				{
					role: 'user',
					content: 'What is the capital of France?'
				}
			]
		};

		client.createChatCompletion(request, {
			onSucceed: function(response:Dynamic):Void
			{
				trace('Success: $response');
			},
			onFail: function(message:String, data:Dynamic):Void
			{
				if (data != null && data.error != null && data.error.message != null)
					trace('Error: $message, ${data.error.message}');
				else
					trace('Error: $message');
			}
		});

		Sys.sleep(10);
	}
}
```

### Licensing

**hxopenai_api** is made available under the **MIT License**. Check [LICENSE](./LICENSE) for more information.
