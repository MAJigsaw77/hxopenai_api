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
