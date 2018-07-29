class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || client = Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status == 201
  end

  def gist_url
    @client.last_response.data[:html_url]
  end

  private

  def gist_params
    {
      description: I18n.t('gist_description', title: @test.title),
      public: true,
      files: {
        I18n.t('gist_filename') => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
