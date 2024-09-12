package hxopenai_api;

import haxe.Http;
import haxe.Json;
import haxe.MainLoop;

/**
 * Typedef for the structure of a chat completion request.
 */
typedef ChatCompletionRequest =
{
	/**
	 * The model name used for generating chat completions.
	 */
	model:String,

	/**
	 * Array of messages exchanged in the chat.
	 */
	messages:Array<Message>,

	/**
	 * Optional temperature parameter controlling randomness in text generation.
	 */
	?temperature:Float,
	/**
	 * Optional maximum number of tokens in the generated completion.
	 */
	?max_tokens:Int,
	/**
	 * Optional nucleus sampling parameter.
	 */
	?top_p:Float,
	/**
	 * Optional frequency penalty parameter.
	 */
	?frequency_penalty:Float,
	/**
	 * Optional presence penalty parameter.
	 */
	?presence_penalty:Float,
	/**
	 * Optional array of stop sequences where generation should terminate.
	 */
	?stop:Array<String>
}

/**
 * Typedef for a message in a chat completion request.
 */
typedef Message =
{
	/**
	 * The role of the message sender (e.g., 'user' or 'system').
	 */
	role:String,

	/**
	 * The content of the message.
	 */
	content:String
}

/**
 * Typedef for the structure of an embeddings request.
 */
typedef EmbeddingsRequest =
{
	/**
	 * The input text or data for which embeddings are requested.
	 */
	input:String,

	/**
	 * The model name or identifier for generating embeddings.
	 */
	model:String,

	/**
	 * Optional user identifier for personalized embeddings.
	 */
	?user:String
}

/**
 * Typedef for the structure of an image generation request.
 */
typedef ImageGenerationRequest =
{
	/**
	 * The prompt or description for generating the image.
	 */
	prompt:String,

	/**
	 * Optional number of images to generate (default is 1).
	 */
	?n:Int,
	/**
	 * Optional size or dimensions of the generated image (e.g., 'small', 'medium', 'large').
	 */
	?size:String,
	/**
	 * Optional response format for the generated image (e.g., 'jpg', 'png').
	 */
	?response_format:String,
	/**
	 * Optional user identifier for personalized image generation.
	 */
	?user:String
}

/**
 * Typedef for the structure of an audio transcription request.
 */
typedef AudioTranscriptionRequest =
{
	/**
	 * The audio file or stream to transcribe.
	 */
	file:Dynamic,

	/**
	 * The model name or identifier for audio transcription.
	 */
	model:String,

	/**
	 * Optional prompt or context for the transcription.
	 */
	?prompt:String,
	/**
	 * Optional response format for the transcription output (e.g., 'json', 'text').
	 */
	?response_format:String,
	/**
	 * Optional temperature parameter controlling randomness in text generation.
	 */
	?temperature:Float,
	/**
	 * Optional language code for transcription (e.g., 'en-US', 'fr-FR').
	 */
	?language:String
}

/**
 * Typedef for the structure of an audio translation request.
 */
typedef AudioTranslationRequest =
{
	/**
	 * The audio file or stream to translate.
	 */
	file:Dynamic,

	/**
	 * The model name or identifier for audio translation.
	 */
	model:String,

	/**
	 * Optional prompt or context for the translation.
	 */
	?prompt:String,
	/**
	 * Optional response format for the translation output (e.g., 'json', 'text').
	 */
	?response_format:String,
	/**
	 * Optional temperature parameter controlling randomness in text generation.
	 */
	?temperature:Float
}

/**
 * Typedef for the structure of a fine-tune creation request.
 */
typedef FineTuneRequest =
{
	/**
	 * The path or URL to the training data file.
	 */
	training_file:String,

	/**
	 * Optional path or URL to the validation data file.
	 */
	?validation_file:String,
	/**
	 * Optional model name or identifier for fine-tuning.
	 */
	?model:String,
	/**
	 * Optional number of epochs for training.
	 */
	?n_epochs:Int,
	/**
	 * Optional batch size for training.
	 */
	?batch_size:Int,
	/**
	 * Optional multiplier for learning rate adjustment.
	 */
	?learning_rate_multiplier:Float,
	/**
	 * Optional weight for prompt-related loss in fine-tuning.
	 */
	?prompt_loss_weight:Float,
	/**
	 * Optional flag to compute classification metrics during fine-tuning.
	 */
	?compute_classification_metrics:Bool,
	/**
	 * Optional number of classes for classification task.
	 */
	?classification_n_classes:Int,
	/**
	 * Optional name or identifier for the positive class in classification.
	 */
	?classification_positive_class:String,
	/**
	 * Optional array of beta values for classification F-beta score computation.
	 */
	?classification_betas:Array<Float>
}

/**
 * Typedef for the structure of a completion request.
 */
typedef CompletionRequest =
{
	/**
	 * The model name or identifier for generating completions.
	 */
	model:String,

	/**
	 * The prompt or input text for which completions are generated.
	 */
	prompt:String,

	/**
	 * Optional maximum number of tokens in the generated completion.
	 */
	?max_tokens:Int
}

/**
 * Typedef for the structure of a completion response.
 */
typedef CompletionResponse =
{
	/**
	 * The unique identifier for the completion response.
	 */
	id:String,

	/**
	 * The type or object category of the response (e.g., 'text_completion').
	 */
	object:String,

	/**
	 * The timestamp when the response was created.
	 */
	created:Int,

	/**
	 * The model name or identifier used for generating the completion.
	 */
	model:String,

	/**
	 * Array of completion choices or generated texts.
	 */
	choices:Array<CompletionChoice>,

	/**
	 * Additional usage details or metadata associated with the response.
	 */
	usage:Null<Dynamic>
}

/**
 * Typedef for the structure of a completion choice.
 */
typedef CompletionChoice =
{
	/**
	 * The generated text or completion choice.
	 */
	text:String,

	/**
	 * The index or position of the choice in the list of completions.
	 */
	index:Int,

	/**
	 * Optional dynamic object containing log probabilities or additional information.
	 */
	?logprobs:Dynamic,

	/**
	 * Reason indicating the completion or generation stopping condition.
	 */
	finish_reason:String
}

/**
 * Typedef for the structure of a fine-tuning job.
 */
typedef FineTuningJob =
{
	/**
	 * The unique identifier for the fine-tuning job.
	 */
	id:String,

	/**
	 * The type or object category of the fine-tuning job (e.g., 'fine_tuning_job').
	 */
	object:String,

	/**
	 * The model name or identifier used for fine-tuning.
	 */
	model:String,

	/**
	 * The timestamp when the fine-tuning job was created.
	 */
	created:Int,

	/**
	 * The current status or state of the fine-tuning job (e.g., 'running', 'completed').
	 */
	status:String,

	/**
	 * The name or identifier of the fine-tuned model resulting from the job.
	 */
	fine_tuned_model:String
}

/**
 * Typedef for the structure of a fine-tuning jobs response.
 */
typedef FineTuningJobsResponse =
{
	/**
	 * Array of fine-tuning job objects.
	 */
	data:Array<FineTuningJob>
}

/**
 * Typedef for the response callbacks for completion requests.
 */
typedef CompletionResponseCallbacks =
{
	/**
	 * Callback function to be executed on successful API response.
	 *
	 * @param response The parsed completion response object.
	 */
	onSucceed:(response:CompletionResponse) -> Void,

	/**
	 * Callback function to be executed on API request failure.
	 *
	 * @param error The error message indicating the reason for failure.
	 * @param error Additional response data if avalible otherwise `null`.
	 */
	onFail:(message:String, data:Dynamic) -> Void
}

/**
 * Typedef for the response callbacks for fine-tuning jobs requests.
 */
typedef FineTuningJobsResponseCallbacks =
{
	/**
	 * Callback function to be executed on successful API response.
	 *
	 * @param response The parsed fine-tuning jobs response object.
	 */
	onSucceed:(response:FineTuningJobsResponse) -> Void,

	/**
	 * Callback function to be executed on API request failure.
	 *
	 * @param error The error message indicating the reason for failure.
	 * @param error Additional response data if avalible otherwise `null`.
	 */
	onFail:(message:String, data:Dynamic) -> Void
}

/**
 * Typedef for the response callbacks with dynamic response type.
 */
typedef DynamicResponseCallbacks =
{
	/**
	 * Callback function to be executed on successful API response.
	 *
	 * @param response The dynamic response object returned by the API.
	 */
	onSucceed:(response:Dynamic) -> Void,

	/**
	 * Callback function to be executed on API request failure.
	 *
	 * @param error The error message indicating the reason for failure.
	 * @param error Additional response data if avalible otherwise `null`.
	 */
	onFail:(message:String, data:Dynamic) -> Void
}

/**
 * A class for interacting with OpenAI API.
 */
class OpenAI
{
	public var apiKey(default, null):String;
	public var baseURL(default, null):String;
	public var organization(default, null):String;
	public var project(default, null):String;

	/**
	 * Creates an instance of OpenAI API client.
	 *
	 * @param apiKey The API key used for authenticating API requests.
	 * @param baseURL The base URL of the OpenAI API (default is 'https://api.openai.com/v1').
	 * @param organization Optional organization identifier for API requests.
	 * @param project Optional project identifier for API requests.
	 */
	public function new(apiKey:String, ?baseURL:String = 'https://api.openai.com/v1', ?organization:String, ?project:String):Void
	{
		this.apiKey = apiKey;
		this.baseURL = baseURL;
		this.organization = organization;
		this.project = project;
	}

	/**
	 * Sends a completion request to the OpenAI API.
	 *
	 * @param request The completion request object.
	 * @param callback The callback functions for handling API response.
	 */
	public inline function completions(request:CompletionRequest, callback:CompletionResponseCallbacks):Void
	{
		postData('$baseURL/completions', request, true, callback.onSucceed, callback.onFail);
	}

	/**
	 * Retrieves a list of fine-tuning jobs from the OpenAI API.
	 *
	 * @param callback The callback functions for handling API response.
	 */
	public inline function listFineTuningJobs(callback:FineTuningJobsResponseCallbacks):Void
	{
		postData('$baseURL/fine_tuning/jobs', null, false, callback.onSucceed, callback.onFail);
	}

	/**
	 * Creates a chat completion request and sends it to the OpenAI API.
	 *
	 * @param request The chat completion request object.
	 * @param callback The callback functions for handling API response.
	 */
	public inline function createChatCompletion(request:ChatCompletionRequest, callback:DynamicResponseCallbacks):Void
	{
		postData('$baseURL/chat/completions', request, true, callback.onSucceed, callback.onFail);
	}

	/**
	 * Creates an embeddings request and sends it to the OpenAI API.
	 *
	 * @param request The embeddings request object.
	 * @param callback The callback functions for handling API response.
	 */
	public inline function createEmbedding(request:EmbeddingsRequest, callback:DynamicResponseCallbacks):Void
	{
		postData('$baseURL/embeddings', request, true, callback.onSucceed, callback.onFail);
	}

	/**
	 * Generates an image based on the provided request and sends it to the OpenAI API.
	 *
	 * @param request The image generation request object.
	 * @param callback The callback functions for handling API response.
	 */
	public inline function generateImage(request:ImageGenerationRequest, callback:DynamicResponseCallbacks):Void
	{
		postData('$baseURL/images/generations', request, true, callback.onSucceed, callback.onFail);
	}

	/**
	 * Transcribes audio based on the provided request and sends it to the OpenAI API.
	 *
	 * @param request The audio transcription request object.
	 * @param callback The callback functions for handling API response.
	 */
	public inline function transcribeAudio(request:AudioTranscriptionRequest, callback:DynamicResponseCallbacks):Void
	{
		postData('$baseURL/audio/transcriptions', request, true, callback.onSucceed, callback.onFail);
	}

	/**
	 * Translates audio based on the provided request and sends it to the OpenAI API.
	 *
	 * @param request The audio translation request object.
	 * @param callback The callback functions for handling API response.
	 */
	public inline function translateAudio(request:AudioTranslationRequest, callback:DynamicResponseCallbacks):Void
	{
		postData('$baseURL/audio/translations', request, true, callback.onSucceed, callback.onFail);
	}

	/**
	 * Creates a fine-tuning job based on the provided request and sends it to the OpenAI API.
	 *
	 * @param request The fine-tune request object.
	 * @param callback The callback functions for handling API response.
	 */
	public inline function createFineTune(request:FineTuneRequest, callback:DynamicResponseCallbacks):Void
	{
		postData('$baseURL/fine_tuning/jobs', request, true, callback.onSucceed, callback.onFail);
	}

	/**
	 * Retrieves a specific fine-tuning job based on the job ID from the OpenAI API.
	 *
	 * @param fineTuneId The ID of the fine-tuning job to retrieve.
	 * @param callback The callback functions for handling API response.
	 */
	public inline function retrieveFineTune(fineTuneId:String, callback:DynamicResponseCallbacks):Void
	{
		postData('$baseURL/fine_tuning/jobs/$fineTuneId', null, false, callback.onSucceed, callback.onFail);
	}

	@:noCompletion
	private function postData(url:String, requestData:Dynamic, post:Bool, onSucceed:(response:Dynamic) -> Void,
			onFail:(message:String, data:Dynamic) -> Void):Void
	{
		MainLoop.addThread(function():Void
		{
			final request:Http = new Http(url);

			request.setHeader('Authorization', 'Bearer $apiKey');
			request.setHeader('Content-Type', 'application/json');

			if (organization != null)
				request.setHeader('OpenAI-Organization', organization);

			if (project != null)
				request.setHeader('OpenAI-Project', project);

			request.onStatus = function(status:Int):Void
			{
				if (status >= 300 && status < 400 && request.responseHeaders.exists('Location'))
				{
					request.url = request.responseHeaders.get('Location');
					request.request(post);
				}
				else if (status >= 300 && status < 400)
				{
					if (onFail != null)
						MainLoop.runInMainThread(() -> onFail('Redirect location header missing', request.responseData != null && request.responseData.length > 0 ? Json.parse(request.responseData) : null));
				}
			}

			request.onData = function(data:String):Void
			{
				final response:Dynamic = Json.parse(data);

				if (response != null)
				{
					if (onSucceed != null)
						MainLoop.runInMainThread(() -> onSucceed(response));
				}
				else
				{
					if (onFail != null)
					{
						MainLoop.runInMainThread(() -> onFail('Unknown error', request.responseData != null
							&& request.responseData.length > 0 ? Json.parse(request.responseData) : null));
					}
				}
			}

			request.onError = function(message:String):Void
			{
				if (onFail != null)
				{
					MainLoop.runInMainThread(() -> onFail(message, request.responseData != null
						&& request.responseData.length > 0 ? Json.parse(request.responseData) : null));
				}
			}

			#if js
			request.async = true;
			#end

			if (post && requestData != null)
				request.setPostData(Json.stringify(requestData));

			request.request(post);
		});
	}
}
