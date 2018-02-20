module ApplicationHelper
	def markdown(content)
		renderer = Redcarpet::Render::HTML.new(hard_wrap: true,filter_html: true)
		options = {
			autolink: true,
			no_intra_emphasis: true,
			disable_intented_code_blocks: true,
			fenced_code_blocks: true,
			lax_html_blocks: true,
			strikethrough: true,
			superscript: true
		}
		Redcarpet::Markdown.new(renderer, options).render(content).html_safe
	end
	def gravatar_for(user, options = {size: 80})
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt:user.username, class: "img-circle")
	end
end
